package CATS::TeX::Data;

# TeX command without backslash => html/mathml entity without '&' and ';'.
# Check font availability when adding new symbols.
our %binary = (
    approx => 'asymp',
    bigcirc => '#x25CB',
    bullet => 'bull',
    cap => 'cap',
    cdot => '#x22C5',
    cdots => '#x22ef',
    circ => '#x2218',
    cup => 'cup',
    equiv => 'equiv',
    ge => 'ge',
    geq => 'ge',
    geqslant => '#x2A7E',
    gg => '#x226B',
    gt => 'gt',
    in => 'isin',
    land => 'and',
    le => 'le',
    leq => 'le',
    leqslant => '#x2A7D',
    ll => '#x226A',
    lnot => 'not',
    lor => 'or',
    lt => 'lt',
    mp => '#x2213',
    ne => 'ne',
    neq => 'ne',
    ni => 'ni',
    notin => 'notin',
    odot => '#x2299',
    ominus => '#x2296',
    oplus => 'oplus',
    oslash => 'empty',
    otimes => 'otimes',
    parallel =>'#x2225',
    perp => 'perp',
    pm => '#xB1',
    subset => 'sub',
    subseteq => 'sube',
    supset => 'sub',
    supseteq => 'supe',
    times => 'times',
    to => '#x21A6',
    vee => 'and',
    wedge => 'or',
);

my %arrows = (
    Rightarrow => 'rArr',
    Leftarrow => 'lArr',
    Leftrightarrow => 'hArr',
    Uparrow => 'uArr',
    Downarrow => 'dArr',
    leftarrow => 'larr',
    rightarrow => 'rarr',
    uparrow => 'uarr',
    downarrow => 'darr',
    mapsto => '#8614',
);

my %special = (
    deg => 'deg',
    'int' => 'int',
    sum => 'sum',
    prod => 'prod',
    'sqrt' => '#x221A',
    partial => 'part',
    triangle => '#x25B3',
    angle => 'ang',
    infty => 'infin',
    forall => 'forall',
    'exists' => 'exist',
    emptyset => 'empty',
    neg => '#xAC',
    nabla => 'nabla',
    dots => 'hellip',
    ldots => 'hellip',
    goodbreak => 'zwnj',
    leftguilsingl => 'lsaquo',
    nobreak => 'zwj',
    quotedblbase => 'bdquo',
    quotesinglbase => 'sbquo',
    rightguilsingl => 'rsaquo',
    lceil => '#x2308',
    rceil => '#x2309',
    lfloor => '#x230A',
    rfloor => '#x230B',
    langle => '#x2329',
    rangle => '#x232A',
    lvert => '#124',
    rvert => '#124',
    lVert => '#8741',
    rVert => '#8741',
);

# Rough approximation.
my %spaces = (
    ';' => 'nbsp',
    ':' => 'nbsp',
    ',' => '#x202F',
    quad => '#x2001',
    qquad => '#x2001;&#x2001',
);

my %greek = (
    Alpha => 'Alpha',
    Beta => 'Beta',
    Chi => 'Chi',
    Delta => 'Delta',
    Epsilon => 'Epsilon',
    Eta => 'Eta',
    Gamma => 'Gamma',
    Iota => 'Iota',
    Kappa => 'Kappa',
    Lambda => 'Lambda',
    Mu => 'Mu',
    Nu => 'Nu',
    Omega => 'Omega',
    Omicron => 'Omicron',
    Phi => 'Phi',
    Pi => 'Pi',
    Psi => 'Psi',
    Rho => 'Rho',
    Sigma => 'Sigma',
    Tau => 'Tau',
    Theta => 'Theta',
    Upsilon => 'Upsilon',
    Xi => 'Xi',
    Zeta => 'Zeta',
    alpha => 'alpha',
    beta => 'beta',
    chi => 'chi',
    delta => 'delta',
    epsilon => 'epsilon',
    eta => 'eta',
    gamma => 'gamma',
    iota => 'iota',
    kappa => 'kappa',
    lambda => 'lambda',
    mu => 'mu',
    nu => 'nu',
    omega => 'omega',
    omicron => 'omicron',
    phi => 'phi',
    pi => 'pi',
    psi => 'psi',
    rho => 'rho',
    sigma => 'sigma',
    tau => 'tau',
    theta => 'theta',
    upsilon => 'upsilon',
    varsigma => 'sigmaf',
    xi => 'xi',
    zeta => 'zeta',
);

my %old = (
    alef => '#x5D0',
    ayin => '#x5E2',
    bet => '#x5D1',
    dalet => '#x5D3',
    finalkaf => '#x5DA',
    finalmem => '#x5DD',
    finalnun => '#x5DF',
    finalpe => '#x5E3',
    finaltsadi => '#x5E5',
    gimel => '#x5D2',
    he => '#x5D4',
    het => '#x5D7',
    kaf => '#x5DB',
    lamed => '#x5DC',
    mem => '#x5DE',
    nun => '#x5E0',
    pe => '#x5E4',
    qof => '#x5E7',
    resh => '#x5E8',
    samekh => '#x5E1',
    shin => '#x5E9',
    tav => '#x5EA',
    tet => '#x5D8',
    tsadi => '#x5E6',
    vav => '#x5D5',
    yod => '#x5D9',
    zayin => '#x5D6',
);

# Combining, large.
our %accents = (
    acute => [  769, '\'' ],
    bar   => [  773, '&#175;' ],
    breve => [  774, '&#728;' ],
    check => [  780, 'v' ],
    dot   => [  775, '&#183;' ],
    ddot  => [  776, '&#183;' ],
    grave => [  768, '`' ],
    hat   => [  770, '^' ],
    tilde => [  771, '~' ],
    vec   => [ 8407, '&#8594;' ],
);

our %symbols = (%binary, %arrows, %special, %spaces, %greek, %old);
%symbols = map { $_ => "\&$symbols{$_};" } keys %symbols;
$symbols{' '} = '&nbsp;';
$symbols{'-'} = '&minus;',
$symbols{rbrace} = $symbols{'}'} = '}';
$symbols{lbrace} = $symbols{'{'} = '{';
$symbols{backslash} = $symbols{setminus} = '\\';

1;
