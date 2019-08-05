Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8098081B1B
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Aug 2019 15:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729281AbfHENL6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Aug 2019 09:11:58 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:46206 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729804AbfHENKy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Aug 2019 09:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=VrCAPwQwFTw1if53nWlT2zlercpavRMIEI0XwlCoYsQ=; b=Ms5BxrLVteV4zzh+7oV/uBRGh
        TXR3nX5sfpayQu52G/5XB9tCD8Fna9FaGr4vBwbShA7ReHxN2SGNGnBOGSGnHmOK3RqFjGou6SgsA
        d8M36V3YTUebG4vAkZ0rxqUueGAJPpA4eEHL2aLxIWLBLMwN6g163SKd+kHbGr7zBxXnU=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hucky-0000Js-H6; Mon, 05 Aug 2019 13:10:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id D91112742D06; Mon,  5 Aug 2019 14:10:30 +0100 (BST)
Date:   Mon, 5 Aug 2019 14:10:30 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH v4 07/10] regulator: mt6358: Add support for MT6358
 regulator
Message-ID: <20190805131030.GE6432@sirena.org.uk>
References: <1564982518-32163-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1564982518-32163-8-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xJK8B5Wah2CMJs8h"
Content-Disposition: inline
In-Reply-To: <1564982518-32163-8-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Cookie: Place stamp here.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--xJK8B5Wah2CMJs8h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 05, 2019 at 01:21:55PM +0800, Hsin-Hsiung Wang wrote:

> +static const u32 vmch_voltages[] = {
> +	2900000, 3000000, 3300000,
> +};

> +static const u32 vemc_voltages[] = {
> +	2900000, 3000000, 3300000,
> +};

Several of these tables appear to be identical.

> +static inline unsigned int mt6358_map_mode(unsigned int mode)
> +{
> +	return mode == MT6358_BUCK_MODE_AUTO ?
> +		REGULATOR_MODE_NORMAL : REGULATOR_MODE_FAST;
> +}

There is no need for this to be an inline and please write normal
conditional statements to improve legibility.  There's other examples in
the driver.

> +static int mt6358_get_buck_voltage_sel(struct regulator_dev *rdev)
> +{
> +	int ret, regval;
> +	struct mt6358_regulator_info *info = rdev_get_drvdata(rdev);
> +
> +	ret = regmap_read(rdev->regmap, info->da_vsel_reg, &regval);
> +	if (ret != 0) {
> +		dev_info(&rdev->dev,
> +			 "Failed to get mt6358 Buck %s vsel reg: %d\n",
> +			 info->desc.name, ret);

dev_err() for errors here and throughout the driver.

> +		return ret;
> +	}
> +
> +	ret = (regval >> info->da_vsel_shift) & info->da_vsel_mask;
> +
> +	return ret;
> +}

This looks like a standard get_voltage_sel_regmap()?

> +err_mode:
> +	if (ret != 0)
> +		return ret;
> +
> +	return 0;

Or just return ret unconditionally?

--xJK8B5Wah2CMJs8h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1IKsYACgkQJNaLcl1U
h9AMIggAg397SgwCnQsqUm0bErtFXMF3frCb8lQZCc/BOEjOShATbn9igZbM6ZTU
QxQabCCpti0hAUqGHB6ye8q+OlI13w8ShOMg6+VJxOhec2ihBGLtkbhJguoZtfVI
v+cqPZf3DxmDs1QCqMQTHdKK47Zjf2GN7XMEubNifpcWlkAHTcrQ8NGTC+8vGcCj
5Ss9eBuRyAO0c5Z08Nsxh70MhK6FnHzwXDzlaOPDXbQWfxouTBvNLHN2LtGeNLDO
St8mmX2B4jwvOLjItqqhsATzbH+DwoBGSOUtRNFbwIh+/UeZfwpwQJJk5U0FsgwC
4K6rYZLMhm8RQGlTWwS3xPlqirZbvg==
=1DeU
-----END PGP SIGNATURE-----

--xJK8B5Wah2CMJs8h--
