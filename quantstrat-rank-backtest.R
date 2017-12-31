


<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# githubog: http://ogp.me/ns/fb/githubog#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Ranking/quantstrat-rank-backtest.R at master · rbresearch/Ranking · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png" />
    <link rel="logo" type="image/svg" href="https://github-media-downloads.s3.amazonaws.com/github-logo.svg" />
    <meta property="og:image" content="https://a248.e.akamai.net/assets.github.com/images/modules/logos_page/Octocat.png">
    <link rel="assets" href="https://a248.e.akamai.net/assets.github.com/">
    <link rel="xhr-socket" href="/_sockets" />
    
    


    <meta name="msapplication-TileImage" content="/windows-tile.png" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="selected-link" value="repo_source" data-pjax-transient />
    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" />

    
    
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />

    <meta content="authenticity_token" name="csrf-param" />
<meta content="BGT9tN8pmnig0EXgm15hfuBjGBnab2DsXTwKuCQ5+aI=" name="csrf-token" />

    <link href="https://a248.e.akamai.net/assets.github.com/assets/github-ea411d39186fc4af5c44122551ef7c2fb888f2bd.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://a248.e.akamai.net/assets.github.com/assets/github2-f6b3e7b90d32d570346948290936ee38e7dbaf5d.css" media="all" rel="stylesheet" type="text/css" />
    


      <script src="https://a248.e.akamai.net/assets.github.com/assets/frameworks-1f72571b966545f4e27481a3b0ebbeeed4f2f139.js" type="text/javascript"></script>
      <script src="https://a248.e.akamai.net/assets.github.com/assets/github-ffa633000167d2fe52aebee0aa148bf43e0f327f.js" type="text/javascript"></script>
      
      <meta http-equiv="x-pjax-version" content="f05acda9e765ce66f2a22f210f1e0b24">

        <link data-pjax-transient rel='permalink' href='/rbresearch/Ranking/blob/436cbcef884f0592e473a040e7557e9552d4aa10/quantstrat-rank-backtest.R'>
  <meta property="og:title" content="Ranking"/>
  <meta property="og:type" content="githubog:gitrepository"/>
  <meta property="og:url" content="https://github.com/rbresearch/Ranking"/>
  <meta property="og:image" content="https://a248.e.akamai.net/assets.github.com/images/gravatars/gravatar-user-420.png"/>
  <meta property="og:site_name" content="GitHub"/>
  <meta property="og:description" content="Ranking - Functions for various methods to rank assets"/>

  <meta name="description" content="Ranking - Functions for various methods to rank assets" />

  <meta content="2328682" name="octolytics-dimension-user_id" /><meta content="rbresearch" name="octolytics-dimension-user_login" /><meta content="5774136" name="octolytics-dimension-repository_id" /><meta content="rbresearch/Ranking" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="5774136" name="octolytics-dimension-repository_network_root_id" /><meta content="rbresearch/Ranking" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/rbresearch/Ranking/commits/master.atom" rel="alternate" title="Recent Commits to Ranking:master" type="application/atom+xml" />

  </head>


  <body class="logged_out page-blob windows vis-public env-production ">

    <div class="wrapper">
      
      
      

      
      <div class="header header-logged-out">
  <div class="container clearfix">

    <a class="header-logo-wordmark" href="https://github.com/">
      <span class="mega-octicon octicon-logo-github"></span>
    </a>

    <div class="header-actions">
      <a class="button primary" href="/signup">Sign up</a>
      <a class="button" href="/login?return_to=%2Frbresearch%2FRanking%2Fblob%2Fmaster%2Fquantstrat-rank-backtest.R">Sign in</a>
    </div>

    <div class="command-bar js-command-bar  in-repository">


      <ul class="top-nav">
          <li class="explore"><a href="/explore">Explore</a></li>
        <li class="features"><a href="/features">Features</a></li>
          <li class="enterprise"><a href="https://enterprise.github.com/">Enterprise</a></li>
          <li class="blog"><a href="/blog">Blog</a></li>
      </ul>
        <form accept-charset="UTF-8" action="/search" class="command-bar-form" id="top_search_form" method="get">

<input type="text" data-hotkey=" s" name="q" id="js-command-bar-field" placeholder="Search or type a command" tabindex="1" autocapitalize="off"
    
    
      data-repo="rbresearch/Ranking"
      data-branch="master"
      data-sha="12dbfa5be2d8e6eac5dcc789f0c29ba7863eed3e"
  >

    <input type="hidden" name="nwo" value="rbresearch/Ranking" />

    <div class="select-menu js-menu-container js-select-menu search-context-select-menu">
      <span class="minibutton select-menu-button js-menu-target">
        <span class="js-select-button">This repository</span>
      </span>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container">
        <div class="select-menu-modal">

          <div class="select-menu-item js-navigation-item selected">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" class="js-search-this-repository" name="search_target" value="repository" checked="checked" />
            <div class="select-menu-item-text js-select-button-text">This repository</div>
          </div> <!-- /.select-menu-item -->

          <div class="select-menu-item js-navigation-item">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" name="search_target" value="global" />
            <div class="select-menu-item-text js-select-button-text">All repositories</div>
          </div> <!-- /.select-menu-item -->

        </div>
      </div>
    </div>

  <span class="octicon help tooltipped downwards" title="Show command bar help">
    <span class="octicon octicon-question"></span>
  </span>


  <input type="hidden" name="ref" value="cmdform">

</form>
    </div>

  </div>
</div>


      


          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        

<ul class="pagehead-actions">


    <li>
      <a href="/login?return_to=%2Frbresearch%2FRanking"
        class="minibutton with-count js-toggler-target star-button entice tooltipped upwards"
        title="You must be signed in to use this feature" rel="nofollow">
        <span class="octicon octicon-star"></span>Star
      </a>
      <a class="social-count js-social-count" href="/rbresearch/Ranking/stargazers">
        1
      </a>
    </li>
    <li>
      <a href="/login?return_to=%2Frbresearch%2FRanking"
        class="minibutton with-count js-toggler-target fork-button entice tooltipped upwards"
        title="You must be signed in to fork a repository" rel="nofollow">
        <span class="octicon octicon-git-branch"></span>Fork
      </a>
      <a href="/rbresearch/Ranking/network" class="social-count">
        2
      </a>
    </li>
</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="repo-label"><span>public</span></span>
          <span class="mega-octicon octicon-repo"></span>
          <span class="author">
            <a href="/rbresearch" class="url fn" itemprop="url" rel="author"><span itemprop="title">rbresearch</span></a></span
          ><span class="repohead-name-divider">/</span><strong
          ><a href="/rbresearch/Ranking" class="js-current-repository js-repo-home-link">Ranking</a></strong>

          <span class="page-context-loader">
            <img alt="Octocat-spinner-32" height="16" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">

      <div class="repository-with-sidebar repo-container
            ">

          <div class="repository-sidebar">

              

<div class="repo-nav repo-nav-full js-repository-container-pjax js-octicon-loaders">
  <div class="repo-nav-contents">
    <ul class="repo-menu">
      <li class="tooltipped leftwards" title="Code">
        <a href="/rbresearch/Ranking" class="js-selected-navigation-item selected" data-gotokey="c" data-pjax="true" data-selected-links="repo_source repo_downloads repo_commits repo_tags repo_branches /rbresearch/Ranking">
          <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

        <li class="tooltipped leftwards" title="Issues">
          <a href="/rbresearch/Ranking/issues" class="js-selected-navigation-item js-disable-pjax" data-gotokey="i" data-selected-links="repo_issues /rbresearch/Ranking/issues">
            <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
            <span class='counter'>0</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>

      <li class="tooltipped leftwards" title="Pull Requests"><a href="/rbresearch/Ranking/pulls" class="js-selected-navigation-item js-disable-pjax" data-gotokey="p" data-selected-links="repo_pulls /rbresearch/Ranking/pulls">
            <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
            <span class='counter'>0</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>


        <li class="tooltipped leftwards" title="Wiki">
          <a href="/rbresearch/Ranking/wiki" class="js-selected-navigation-item " data-pjax="true" data-selected-links="repo_wiki /rbresearch/Ranking/wiki">
            <span class="octicon octicon-book"></span> <span class="full-word">Wiki</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>


    </ul>
    <div class="repo-menu-separator"></div>
    <ul class="repo-menu">

      <li class="tooltipped leftwards" title="Pulse">
        <a href="/rbresearch/Ranking/pulse" class="js-selected-navigation-item " data-pjax="true" data-selected-links="pulse /rbresearch/Ranking/pulse">
          <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" title="Graphs">
        <a href="/rbresearch/Ranking/graphs" class="js-selected-navigation-item " data-pjax="true" data-selected-links="repo_graphs repo_contributors /rbresearch/Ranking/graphs">
          <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" title="Network">
        <a href="/rbresearch/Ranking/network" class="js-selected-navigation-item js-disable-pjax" data-selected-links="repo_network /rbresearch/Ranking/network">
          <span class="octicon octicon-git-branch"></span> <span class="full-word">Network</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

    </ul>

  </div>
</div>


              <div class="only-with-full-nav">

                

  

<div class="clone-url open"
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone">
  <h3><strong>HTTPS</strong> clone URL</h3>

  <input type="text" class="clone js-url-field"
         value="https://github.com/rbresearch/Ranking.git" readonly="readonly">

  <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/rbresearch/Ranking.git" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
</div>

  

<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone">
  <h3><strong>Subversion</strong> checkout URL</h3>

  <input type="text" class="clone js-url-field"
         value="https://github.com/rbresearch/Ranking" readonly="readonly">

  <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/rbresearch/Ranking" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
</div>



<p class="clone-options">You can clone with
    <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a>,
    <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>,
  and <a href="https://help.github.com/articles/which-remote-url-should-i-use">other methods.</a>
</p>


  <a href="http://windows.github.com" class="minibutton sidebar-button">
    <span class="octicon octicon-device-desktop"></span>
    Clone in Desktop
  </a>


                  <a href="/rbresearch/Ranking/archive/master.zip"
                     class="minibutton sidebar-button"
                     title="Download this repository as a zip file"
                     rel="nofollow">
                    <span class="octicon octicon-cloud-download"></span>
                    Download ZIP
                  </a>

              </div>
          </div>

          <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
            


<!-- blob contrib key: blob_contributors:v21:06df04462c0272b1483b89b884378a07 -->
<!-- blob contrib frag key: views10/v8/blob_contributors:v21:06df04462c0272b1483b89b884378a07 -->

<p title="This is a placeholder element" class="js-history-link-replace hidden"></p>

<a href="/rbresearch/Ranking/find/master" data-pjax data-hotkey="t" style="display:none">Show File Finder</a>

<div class="file-navigation">
  


<div class="select-menu js-menu-container js-select-menu" >
  <span class="minibutton select-menu-button js-menu-target" data-hotkey="w"
    data-master-branch="master"
    data-ref="master">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax>

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-remove-close js-menu-close"></span>
      </div> <!-- /.select-menu-header -->

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div><!-- /.select-menu-tabs -->
      </div><!-- /.select-menu-filters -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/rbresearch/Ranking/blob/master/quantstrat-rank-backtest.R" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="master" rel="nofollow" title="master">master</a>
            </div> <!-- /.select-menu-item -->
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

    </div> <!-- /.select-menu-modal -->
  </div> <!-- /.select-menu-modal-holder -->
</div> <!-- /.select-menu -->

  <div class="breadcrumb">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/rbresearch/Ranking" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">Ranking</span></a></span></span><span class="separator"> / </span><strong class="final-path">quantstrat-rank-backtest.R</strong> <span class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="quantstrat-rank-backtest.R" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>


  
  <div class="commit file-history-tease">
    <img class="main-avatar" height="24" src="https://secure.gravatar.com/avatar/ef6a1b7d047090cf5d18d3e3a5f74a06?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
    <span class="author"><a href="/rbresearch" rel="author">rbresearch</a></span>
    <time class="js-relative-date" datetime="2013-02-19T20:04:12-08:00" title="2013-02-19 20:04:12">February 19, 2013</time>
    <div class="commit-title">
        <a href="/rbresearch/Ranking/commit/436cbcef884f0592e473a040e7557e9552d4aa10" class="message">edits to quantstrat-rank-backtest.R</a>
    </div>

    <div class="participation">
      <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>1</strong> contributor</a></p>
      
    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
        <li class="facebox-user-list-item">
          <img height="24" src="https://secure.gravatar.com/avatar/ef6a1b7d047090cf5d18d3e3a5f74a06?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/rbresearch">rbresearch</a>
        </li>
      </ul>
    </div>
  </div>


<div id="files" class="bubble">
  <div class="file">
    <div class="meta">
      <div class="info">
        <span class="icon"><b class="octicon octicon-file-text"></b></span>
        <span class="mode" title="File Mode">file</span>
          <span>74 lines (56 sloc)</span>
        <span>2.544 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
              <a class="minibutton js-entice" href=""
                 data-entice="You must be signed in and on a branch to make or propose changes">Edit</a>
          <a href="/rbresearch/Ranking/raw/master/quantstrat-rank-backtest.R" class="button minibutton " id="raw-url">Raw</a>
            <a href="/rbresearch/Ranking/blame/master/quantstrat-rank-backtest.R" class="button minibutton ">Blame</a>
          <a href="/rbresearch/Ranking/commits/master/quantstrat-rank-backtest.R" class="button minibutton " rel="nofollow">History</a>
        </div><!-- /.button-group -->
      </div><!-- /.actions -->

    </div>
                <div class="blob-wrapper data type-r js-blob-data">
      <table class="file-code file-diff">
        <tr class="file-code-line">
          <td class="blob-line-nums">
            <span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>
<span id="L42" rel="#L42">42</span>
<span id="L43" rel="#L43">43</span>
<span id="L44" rel="#L44">44</span>
<span id="L45" rel="#L45">45</span>
<span id="L46" rel="#L46">46</span>
<span id="L47" rel="#L47">47</span>
<span id="L48" rel="#L48">48</span>
<span id="L49" rel="#L49">49</span>
<span id="L50" rel="#L50">50</span>
<span id="L51" rel="#L51">51</span>
<span id="L52" rel="#L52">52</span>
<span id="L53" rel="#L53">53</span>
<span id="L54" rel="#L54">54</span>
<span id="L55" rel="#L55">55</span>
<span id="L56" rel="#L56">56</span>
<span id="L57" rel="#L57">57</span>
<span id="L58" rel="#L58">58</span>
<span id="L59" rel="#L59">59</span>
<span id="L60" rel="#L60">60</span>
<span id="L61" rel="#L61">61</span>
<span id="L62" rel="#L62">62</span>
<span id="L63" rel="#L63">63</span>
<span id="L64" rel="#L64">64</span>
<span id="L65" rel="#L65">65</span>
<span id="L66" rel="#L66">66</span>
<span id="L67" rel="#L67">67</span>
<span id="L68" rel="#L68">68</span>
<span id="L69" rel="#L69">69</span>
<span id="L70" rel="#L70">70</span>
<span id="L71" rel="#L71">71</span>
<span id="L72" rel="#L72">72</span>
<span id="L73" rel="#L73">73</span>

          </td>
          <td class="blob-line-code">
                  <div class="highlight"><pre><div class='line' id='LC1'><span class="c1"># quantstrat-rank-backtest.R</span></div><div class='line' id='LC2'><br/></div><div class='line' id='LC3'>rm<span class="p">(</span>list<span class="o">=</span>ls<span class="p">())</span></div><div class='line' id='LC4'><br/></div><div class='line' id='LC5'>library<span class="p">(</span>quantstrat<span class="p">)</span></div><div class='line' id='LC6'>library<span class="p">(</span>PerformanceAnalytics<span class="p">)</span></div><div class='line' id='LC7'><br/></div><div class='line' id='LC8'><span class="c1"># Rank.R contains functions for different ranking algorithms</span></div><div class='line' id='LC9'>source<span class="p">(</span><span class="s">&quot;/Users/rossbennett/Documents/R Projects/Ranking/rank-functions/Rank.R&quot;</span><span class="p">)</span></div><div class='line' id='LC10'><br/></div><div class='line' id='LC11'><span class="c1"># monthly-fun.R contains functions for prepping monthly data</span></div><div class='line' id='LC12'>source<span class="p">(</span><span class="s">&quot;/Users/rossbennett/Documents/R Projects/Ranking/rank-functions/monthly-fun.R&quot;</span><span class="p">)</span></div><div class='line' id='LC13'><br/></div><div class='line' id='LC14'><span class="c1"># qstratRank.R contains the function to run the Rank backtest using the</span></div><div class='line' id='LC15'><span class="c1"># quantstrat framework</span></div><div class='line' id='LC16'>source<span class="p">(</span><span class="s">&quot;/Users/rossbennett/Documents/R Projects/Ranking/rank-functions/qstratRank.R&quot;</span><span class="p">)</span></div><div class='line' id='LC17'><br/></div><div class='line' id='LC18'>currency<span class="p">(</span><span class="s">&quot;USD&quot;</span><span class="p">)</span></div><div class='line' id='LC19'>symbols <span class="o">&lt;-</span> c<span class="p">(</span><span class="s">&quot;XLY&quot;</span><span class="p">,</span> <span class="s">&quot;XLP&quot;</span><span class="p">,</span> <span class="s">&quot;XLE&quot;</span><span class="p">,</span> <span class="s">&quot;AGG&quot;</span><span class="p">,</span> <span class="s">&quot;IVV&quot;</span><span class="p">)</span></div><div class='line' id='LC20'>stock<span class="p">(</span>symbols<span class="p">,</span> currency<span class="o">=</span><span class="s">&quot;USD&quot;</span><span class="p">)</span></div><div class='line' id='LC21'><br/></div><div class='line' id='LC22'><span class="c1"># get data for the symbols</span></div><div class='line' id='LC23'>getSymbols<span class="p">(</span>symbols<span class="p">,</span> from<span class="o">=</span><span class="s">&quot;2005-01-01&quot;</span><span class="p">,</span> to<span class="o">=</span><span class="s">&quot;2012-12-31&quot;</span><span class="p">)</span></div><div class='line' id='LC24'><br/></div><div class='line' id='LC25'><span class="c1"># create an xts object of monthly adjusted close prices</span></div><div class='line' id='LC26'>symbols.close <span class="o">&lt;-</span> monthlyPrices<span class="p">(</span>symbols<span class="p">)</span></div><div class='line' id='LC27'><br/></div><div class='line' id='LC28'><span class="c1"># create an xts object of the symbol ranks</span></div><div class='line' id='LC29'>sym.rank <span class="o">&lt;-</span> applyRank<span class="p">(</span>x<span class="o">=</span>symbols.close<span class="p">,</span> rankFun<span class="o">=</span>ave3ROC<span class="p">,</span> n<span class="o">=</span>c<span class="p">(</span><span class="m">2</span><span class="p">,</span> <span class="m">4</span><span class="p">,</span> <span class="m">6</span><span class="p">))</span></div><div class='line' id='LC30'><br/></div><div class='line' id='LC31'><span class="c1"># this is an important step in naming the columns, e.g. XLY.Rank</span></div><div class='line' id='LC32'><span class="c1"># the &quot;Rank&quot; column is used as the trade signal (similar to an indicator)</span></div><div class='line' id='LC33'><span class="c1"># in the qstratRank function</span></div><div class='line' id='LC34'>colnames<span class="p">(</span>sym.rank<span class="p">)</span> <span class="o">&lt;-</span> gsub<span class="p">(</span><span class="s">&quot;.Adjusted&quot;</span><span class="p">,</span> <span class="s">&quot;.Rank&quot;</span><span class="p">,</span> colnames<span class="p">(</span>sym.rank<span class="p">))</span></div><div class='line' id='LC35'><br/></div><div class='line' id='LC36'><span class="c1"># ensure the order of order symbols is equal to the order of columns </span></div><div class='line' id='LC37'><span class="c1"># in symbols.close</span></div><div class='line' id='LC38'>stopifnot<span class="p">(</span>all.equal<span class="p">(</span>gsub<span class="p">(</span><span class="s">&quot;.Adjusted&quot;</span><span class="p">,</span> <span class="s">&quot;&quot;</span><span class="p">,</span> colnames<span class="p">(</span>symbols.close<span class="p">)),</span> symbols<span class="p">))</span></div><div class='line' id='LC39'><br/></div><div class='line' id='LC40'><span class="c1"># bind the rank column to the appropriate symbol market data</span></div><div class='line' id='LC41'><span class="c1"># loop through symbols, convert the data to monthly and cbind the data</span></div><div class='line' id='LC42'><span class="c1"># to the rank</span></div><div class='line' id='LC43'><span class="kr">for</span><span class="p">(</span>i <span class="kr">in</span> <span class="m">1</span><span class="o">:</span>length<span class="p">(</span>symbols<span class="p">))</span> <span class="p">{</span></div><div class='line' id='LC44'>&nbsp;&nbsp;x <span class="o">&lt;-</span> get<span class="p">(</span>symbols<span class="p">[</span>i<span class="p">])</span></div><div class='line' id='LC45'>&nbsp;&nbsp;x <span class="o">&lt;-</span> to.monthly<span class="p">(</span>x<span class="p">,</span>indexAt<span class="o">=</span><span class="s">&#39;lastof&#39;</span><span class="p">,</span>drop.time<span class="o">=</span><span class="kc">TRUE</span><span class="p">)</span></div><div class='line' id='LC46'>&nbsp;&nbsp;indexFormat<span class="p">(</span>x<span class="p">)</span> <span class="o">&lt;-</span> <span class="s">&#39;%Y-%m-%d&#39;</span></div><div class='line' id='LC47'>&nbsp;&nbsp;colnames<span class="p">(</span>x<span class="p">)</span> <span class="o">&lt;-</span> gsub<span class="p">(</span><span class="s">&quot;x&quot;</span><span class="p">,</span>symbols<span class="p">[</span>i<span class="p">],</span>colnames<span class="p">(</span>x<span class="p">))</span></div><div class='line' id='LC48'>&nbsp;&nbsp;x <span class="o">&lt;-</span> cbind<span class="p">(</span>x<span class="p">,</span> sym.rank<span class="p">[,</span>i<span class="p">])</span></div><div class='line' id='LC49'>&nbsp;&nbsp;assign<span class="p">(</span>symbols<span class="p">[</span>i<span class="p">],</span>x<span class="p">)</span></div><div class='line' id='LC50'><span class="p">}</span></div><div class='line' id='LC51'><br/></div><div class='line' id='LC52'><span class="c1"># run the backtest</span></div><div class='line' id='LC53'>bt <span class="o">&lt;-</span> qstratRank<span class="p">(</span>symbols<span class="o">=</span>symbols<span class="p">,</span> init.equity<span class="o">=</span><span class="m">100000</span><span class="p">,</span> top.N<span class="o">=</span><span class="m">2</span><span class="p">,</span></div><div class='line' id='LC54'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;max.size<span class="o">=</span><span class="m">1000</span><span class="p">,</span> max.levels<span class="o">=</span><span class="m">2</span><span class="p">)</span></div><div class='line' id='LC55'><br/></div><div class='line' id='LC56'><span class="c1"># get trade stats</span></div><div class='line' id='LC57'>bt.stats <span class="o">&lt;-</span> bt<span class="o">$</span>stats</div><div class='line' id='LC58'><br/></div><div class='line' id='LC59'><span class="c1"># chart of returns</span></div><div class='line' id='LC60'>charts.PerformanceSummary<span class="p">(</span>bt<span class="o">$</span>returns<span class="p">[,</span><span class="s">&quot;total&quot;</span><span class="p">],</span> geometric<span class="o">=</span><span class="kc">FALSE</span><span class="p">,</span> </div><div class='line' id='LC61'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;wealth.index<span class="o">=</span><span class="kc">TRUE</span><span class="p">,</span> main<span class="o">=</span><span class="s">&quot;Total Performance&quot;</span><span class="p">)</span></div><div class='line' id='LC62'><br/></div><div class='line' id='LC63'><br/></div><div class='line' id='LC64'><span class="c1">###############################################################################</span></div><div class='line' id='LC65'><span class="c1"># R (http://r-project.org/) Quantitative Strategy Model Framework</span></div><div class='line' id='LC66'><span class="c1">#</span></div><div class='line' id='LC67'><span class="c1"># Copyright (c) 2009-2012</span></div><div class='line' id='LC68'><span class="c1"># Peter Carl, Dirk Eddelbuettel, Brian G. Peterson, Jeffrey Ryan, and Joshua Ulrich </span></div><div class='line' id='LC69'><span class="c1">#</span></div><div class='line' id='LC70'><span class="c1"># This library is distributed under the terms of the GNU Public License (GPL)</span></div><div class='line' id='LC71'><span class="c1"># for full details see the file COPYING</span></div><div class='line' id='LC72'><span class="c1">#</span></div><div class='line' id='LC73'><span class="c1">###############################################################################</span></div></pre></div>
          </td>
        </tr>
      </table>
  </div>

  </div>
</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" class="js-jump-to-line" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" class="js-jump-to-line-form">
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;">
    <button type="submit" class="button">Go</button>
  </form>
</div>
          </div>
        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div>
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer">
    <ul class="site-footer-links right">
      <li><a href="https://status.github.com/">Status</a></li>
      <li><a href="http://developer.github.com">Developer</a></li>
      <li><a href="http://training.github.com">Training</a></li>
      <li><a href="http://shop.github.com">Shop</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="/about">About</a></li>
    </ul>

    <a href="/">
      <span class="mega-octicon octicon-mark-github"></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2013 <span title="0.05157s from fe2.rs.github.com">GitHub</span>, Inc.</li>
        <li><a href="/site/terms">Terms</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
  </div><!-- /.site-footer -->
</div><!-- /.container -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-fullscreen-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="js-fullscreen-contents" placeholder="" data-suggester="fullscreen_suggester"></textarea>
          <div class="suggester-container">
              <div class="suggester fullscreen-suggester js-navigation-container" id="fullscreen_suggester"
                 data-url="/rbresearch/Ranking/suggestions/commit">
              </div>
          </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped leftwards" title="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped leftwards"
      title="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-remove-close close ajax-error-dismiss"></a>
      Something went wrong with that request. Please try again.
    </div>

    
    <span id='server_response_time' data-time='0.05197' data-host='fe2'></span>
    
  </body>
</html>

