function PrzegladarkaZdjec(id, zdjecia)
{
    this.czas = 5;	// czas przejścia w trybie pokazu slajdów [sek]
	
	
    this.id = id;
    this.zdjecia = zdjecia;
    var timerID = null;
	
    this.wyswietl = function(nr)
    {
        clearTimeout(timerID);
        var f = document.getElementById(this.id);
		
        if (nr < 0) nr = f.elements['zdjecia'].options.length - 1;
        else if (nr > f.elements['zdjecia'].options.length - 1) nr = 0;
		
        if (nr == 0)
        {
            f.elements['poczatek'].disabled = true;
            f.elements['wstecz'].disabled = true;
            f.elements['dalej'].disabled = false;
            f.elements['koniec'].disabled = false;
        }
        else if (nr == f.elements['zdjecia'].options.length - 1)
        {
            f.elements['poczatek'].disabled = false;
            f.elements['wstecz'].disabled = false;
            f.elements['dalej'].disabled = true;
            f.elements['koniec'].disabled = true;
        }
        else
        {
            f.elements['poczatek'].disabled = false;
            f.elements['wstecz'].disabled = false;
            f.elements['dalej'].disabled = false;
            f.elements['koniec'].disabled = false;
        }
		
        f.elements['zdjecia'].selectedIndex = nr;
        document.getElementById(this.id + '__img').src = f.elements['zdjecia'].options[nr].value;
        document.getElementById(this.id + '__opis').innerHTML = typeof this.zdjecia[nr][2] != 'undefined' ? this.zdjecia[nr][2] : '';
        if (f.elements['auto'].checked) this.przewin();
    }
	
    this.przewin = function()
    {
        clearTimeout(timerID);
        var f = document.getElementById(this.id);
        if (f.elements['auto'].checked)
        {
            if (document.getElementById(this.id + '__img').complete) timerID = setTimeout
                (this.id + '.wyswietl(' + (f.elements['zdjecia'].selectedIndex < f.elements['zdjecia'].options.length - 1 ? f.elements['zdjecia'].selectedIndex + 1 : 0) + ')', this.czas * 1000);
            else timerID = setTimeout(this.id + '.przewin()', 500);
        }
    }
	
    var matches = window.location.search.match(new RegExp('[\?&]' + this.id + '=(-?[0-9]+)(&|$)'));
    if (matches && typeof matches[1] != 'undefined')
    {
        var auto = matches[1].substring(0, 1) == '-' ? true : false;
        matches[1] = parseInt(matches[1]);
        var nr = Math.abs(matches[1]);
        if (nr < 0) nr = 0;
        else if (nr > zdjecia.length - 1) nr = zdjecia.length - 1;
    }
    else
    {
        var nr = 0;
        var auto = false;
    }
	
    for (var i = 0, html = ''; i < zdjecia.length; i++)
    {
        html += '<option value="' + zdjecia[i][0] + '"' + (i == nr ? ' selected="selected"' : '') + '>' + zdjecia[i][1] + '</option>';
    }
	
    document.write(
        '<form action="javascript:void(0)" id="' + this.id + '" class="zdjecia">' +
        
        '<div class="zdjecia_menu">' +

        '<input type="button" name="poczatek" value="|&lt;&lt;"' + (nr == 0 ? ' disabled="disabled"' : '') + ' title="Poczatek" onclick="' + this.id +
            '.wyswietl(0)" onkeypress="' + this.id + '.wyswietl(0)" />' +

        '<input type="button" name="wstecz" value="  &lt;&lt;  "' + (nr == 0 ? ' disabled="disabled"' : '') + ' title="Wstecz" onclick="' + this.id +
            '.wyswietl(this.form.elements[\'zdjecia\'].selectedIndex - 1)" onkeypress="' + this.id + '.wyswietl(this.form.elements[\'zdjecia\'].selectedIndex - 1)" />' +

        ' <select name="zdjecia" onchange="' + this.id + '.wyswietl(this.selectedIndex)">' +

        html +
        '</select> ' +

        '<input type="button" name="dalej" value="  &gt;&gt;  "' + (nr == zdjecia.length - 1 ? ' disabled="disabled"' : '') + ' title="Dalej" onclick="' + this.id +
            '.wyswietl(this.form.elements[\'zdjecia\'].selectedIndex + 1)" onkeypress="' + this.id + '.wyswietl(this.form.elements[\'zdjecia\'].selectedIndex + 1)" />' +

        '<input type="button" name="koniec" value="&gt;&gt;|"' + (nr == zdjecia.length - 1 ? ' disabled="disabled"' : '') + ' title="Koniec" onclick="' + this.id +
            '.wyswietl(this.form.elements[\'zdjecia\'].options.length - 1)" onkeypress="' + this.id + '.wyswietl(this.form.elements[\'zdjecia\'].options.length - 1)" />' +

     /*pokaz slajdów*/
  
        '<div><input type="checkbox" name="auto"' + (auto ? ' checked="checked"' : '') + ' id="' + this.id + '__auto" onclick="' + this.id + '.przewin()" onkeypress="' + this.id +
             '.przewin()" style="vertical-align: middle" /> <label for="' + this.id + '__auto">Pokaz slajdow</label></div>' +
        '</div>' +
        '<img id="' + this.id + '__img" src="' + zdjecia[nr][0] + '" alt="" title="Dalej..." onclick="' + this.id + '.wyswietl(document.getElementById(\'' + this.id + '\').elements[\'zdjecia\'].selectedIndex + 1)" />' +
        '<div class="zdjecia_opis" id="' + this.id + '__opis">' + (typeof zdjecia[nr][2] != 'undefined' ? zdjecia[nr][2]: '') + '</div>' +
        '</form>'
        );
	
    if (auto) this.przewin();
}
