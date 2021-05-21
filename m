Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A14C638BC74
	for <lists+linux-rtc@lfdr.de>; Fri, 21 May 2021 04:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238205AbhEUCjA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 May 2021 22:39:00 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:57187 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231681AbhEUCi7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 May 2021 22:38:59 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1764C58094A;
        Thu, 20 May 2021 22:37:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 20 May 2021 22:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        to:cc:references:from:subject:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=D
        e6xzMF2FgeEmdaTMR3eSkk8CwPQCVbY4en6vEtoeyA=; b=GyCY0HdhhuUpmr374
        VfMZMmReizfI2KIX6FBCHJUH+YNxdm7gVtajBS6b+3I/d7LICeo2mdVdWAmpfHr0
        BIPLtTuWlYy9EWTwSTg6uHS+N17fgQT+tytiqJgGgQ/r1GLeF4ukLiMP+hWXEkB/
        pLmD34ipjZtePC3G5uVNISWrlDKUUEPTtOA/ZkloP3hfk5z/aqiBnErOSgtXTkYT
        JDH17LxNyOquZcXhQmV7JjBweDC8nKCE+Zj2DdCZ0sXmooHNtjOuNo1u4cYGiSjF
        s2Jp1Er5XkkRTl9Y64fXEmqoLT2sD9zN3iKyrx/PdVGTDc/52Y2KxHKWg/uFc7M0
        sVG6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=De6xzMF2FgeEmdaTMR3eSkk8CwPQCVbY4en6vEtoe
        yA=; b=R/B7VL5XgmRVFvF0Jw4g+3tfflkqISOf6/2rXzXrS/nd2FDTYx/LOLnRK
        lBWgJgwe3/DKj/PVws7Scj3+x31ofpDJGkvqgCNIvojKdZrdJsP9EaxbJ4GWaZ6q
        msAj6NCs0b8y8kgy6KaG1skjuZRyEB2LKb6QzP1FeyxDwyoJSPVNIfxhPCnhgw/B
        gWTPfny4NfCltqwvPTBKUK/bCGmrtj4PEKKByQZa+2nhr9vMvEhUUBx5CvffXgNw
        fR7VtfDF8MJebK0qRXgBFPaGWTo7kJHPR7iFxifIsuLA066o70mwKhweo0GS9u4z
        3MuFHSKGl2qZB4nAKWsPlgb11KAgw==
X-ME-Sender: <xms:7xynYFU_IU-YS9abw3wxkTkrYZgXGTRwnHXE3gQ6yK-RXcc35qUjqQ>
    <xme:7xynYFlxYPA_AMIKChNAn6I3cn5GZGkPEFELW2wua3X5OeWFDR6kv4zy3G3lqXH_G
    lRd9DS7y3na5p7YFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejvddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepvfhfhffukffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepvddttdejieduudfgffevteekffegffeguddtgfefkeduvedukeff
    hedtfeevuedvnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:7xynYBaRUqI3D8YrkCIHs8AoiUMdjhvH6ciBF5I4HtCmDnjFbj0u2g>
    <xmx:7xynYIX2rGRypVm2udaXepLfm5Z_TT6razf4LIhJggqtApUkLCAJsA>
    <xmx:7xynYPk4ABhXgKMwzixt8SqRm4yqHz3HXtiIru0Eesq-4aXbcOqx3A>
    <xmx:8RynYC8r69Q4k1_jputi0x3LS84eIketYJpntW8loxTEydbCNM15EQ>
Received: from [70.135.148.151] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Thu, 20 May 2021 22:37:34 -0400 (EDT)
To:     Andre Przywara <andre.przywara@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Ondrej Jirman <megous@megous.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
References: <20210519104152.21119-1-andre.przywara@arm.com>
 <20210519104152.21119-4-andre.przywara@arm.com>
From:   Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v6 03/17] dt-bindings: rtc: sun6i: Add H616 compatible
 string
Message-ID: <99a2069b-99e9-9b47-12a6-aae01c7f59dc@sholland.org>
Date:   Thu, 20 May 2021 21:37:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210519104152.21119-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Andre,

On 5/19/21 5:41 AM, Andre Przywara wrote:
> Add the obvious compatible name to the existing RTC binding.
> The actual RTC part of the device uses a different day/month/year
> storage scheme, so it's not compatible with the previous devices.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> index b1b0ee769b71..178c955f88bf 100644
> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> @@ -26,6 +26,7 @@ properties:
>            - const: allwinner,sun50i-a64-rtc
>            - const: allwinner,sun8i-h3-rtc
>        - const: allwinner,sun50i-h6-rtc
> +      - const: allwinner,sun50i-h616-rtc
>  
>    reg:
>      maxItems: 1
> @@ -97,7 +98,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: allwinner,sun50i-h6-rtc
> +            enum:
> +              - allwinner,sun50i-h6-rtc
> +              - allwinner,sun50i-h616-rtc
>  
>      then:
>        properties:
> 

This binding is missing a clock reference for the pll-periph0-2x input
to the 32kHz clock fanout.

It is also missing a clock reference to the RTC register gate (and that
clock is in turn missing from the r_ccu driver).

Regards,
Samuel
