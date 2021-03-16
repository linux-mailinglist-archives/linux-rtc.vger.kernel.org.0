Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5857333DB73
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 18:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234714AbhCPRwn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Mar 2021 13:52:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:42924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239353AbhCPRw2 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 16 Mar 2021 13:52:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B57765120;
        Tue, 16 Mar 2021 17:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615917148;
        bh=AzDNWIakpV6kbVyD7mjxNrEJxc3kYf5SEm43UCNUWF4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rFYiJR/9X5zpZaiPy4Jjpf724cR4XAh94ugE3KkSc3qHUKTZWMJ8hMT67XayFNWpc
         nJJaorFHkN8umklWYKxY0lppxEqqjTxb8aftsIldEvAVsWZyV5DNKeJTFUA8n14Hzo
         2m7wmdBKNqOvfFt1hUIHMkotK26e2X4v4+2aMiL82hJWDa26DTZfLr4W2IhuHrdo+m
         bBrvucRxFrUcuuy6ix1EcPLXXhTUr5KlxH0zAABC6dDp+S7Cm5V7X6i/7hZKTR6dET
         uaIil5JMPAOVXnrXdYQZ34g2JJEcDEfV/Fge5AVj5zgSXw5DusSmK86zAgsD1OZxeU
         AiF0uMtV1FfCg==
Date:   Tue, 16 Mar 2021 17:52:25 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Fei Shao <fshao@chromium.org>, Ran Bi <ran.bi@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 7/8] regulator: mt6359: Add support for MT6359P
 regulator
Message-ID: <20210316175225.GD4309@sirena.org.uk>
References: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1615829757-3223-8-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SFyWQ0h3ruR435lw"
Content-Disposition: inline
In-Reply-To: <1615829757-3223-8-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Cookie: Results vary by individual.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--SFyWQ0h3ruR435lw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 16, 2021 at 01:35:56AM +0800, Hsin-Hsiung Wang wrote:
> The MT6359P is a eco version for MT6359 regulator.
> We add support based on MT6359 regulator driver.

Acked-by: Mark Brown <broonie@kernel.org>

--SFyWQ0h3ruR435lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBQ8FgACgkQJNaLcl1U
h9CdkAf9Hbz0m/xv65ZqrW8tLgUxjCTjcWpw/fLlr0NuMnmtYANHKy9Pjs76Vl2W
2kyXSeAcDdKV4/j8aEK8fd8JOMZTqUuN5OmJDoUvIN7DSDd0E3BFeT5bvBvUTnWN
BbP8WBJPBF9pIHsv9D2xT/QlaXVvGjohZHFG41XSfllNGw1DjPFAjkAhTOyXzT1t
s+tuHrpLJxzxyvK07WJnt9LfFMz80mgKT7PEhalXP1KRbkLM2wXuSEBgoy4bm5ZZ
XF7thh112bug+30SXTGVBzutbHJr3o4YSRNbHOysnpalWONxfVoZjrRoTgeW5SeK
bbowgAEaY7/4sEMAKWFqF25+fW8QCA==
=C2bz
-----END PGP SIGNATURE-----

--SFyWQ0h3ruR435lw--
