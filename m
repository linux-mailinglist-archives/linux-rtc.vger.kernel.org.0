Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42A36A0022
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Aug 2019 12:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfH1KqH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 28 Aug 2019 06:46:07 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:43754 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfH1KqH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 28 Aug 2019 06:46:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=xEk+7C1PeYR/dQCDWZ88puZD6TYZGeKl16GGfqOsMlE=; b=YaK6OBCmH+nTMmCNTe5KwcsNc
        K1AaF0EoXYG4wJvyp20sq3QK0qUrshXEZza54GLmgqgJzISgbukntzkkGcFkiZd1PZidUbIiFPT6Z
        +xK8S/7o5ZRs/0bzt49bTUqU4kDOVR9qc5/obE+R4dAJbpPy54r+L7eF8agGPv2N9eT+0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i2vSe-0003cz-AO; Wed, 28 Aug 2019 10:45:56 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 894632742A55; Wed, 28 Aug 2019 11:45:55 +0100 (BST)
Date:   Wed, 28 Aug 2019 11:45:55 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH v5 07/10] regulator: mt6358: Add support for MT6358
 regulator
Message-ID: <20190828104555.GE4298@sirena.co.uk>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1566531931-9772-8-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PPYy/fEw/8QCHSq3"
Content-Disposition: inline
In-Reply-To: <1566531931-9772-8-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Cookie: Oatmeal raisin.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--PPYy/fEw/8QCHSq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 23, 2019 at 11:45:28AM +0800, Hsin-Hsiung Wang wrote:
> The MT6358 is a regulator found on boards based on MediaTek MT8183 and
> probably other SoCs. It is a so called pmic and connects as a slave to
> SoC using SPI, wrapped inside the pmic-wrapper.

This looks good - since there was only one small issue with the example
in the binding document I'll apply both patches, please send a followup
fixing the binding document.

--PPYy/fEw/8QCHSq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1mW2IACgkQJNaLcl1U
h9BSkwf/dn5XU4gEVNtDS9XFnqmJE1/jcGPItKtO0MNfD3jrB/hUyBWMYoBhI+sU
Vm45cGP+4DM/3BcJrj6qrmvgSmYZtpf6vn0RljmVuFlo5SOk4y4/HI8i+gdjcrER
26tolRdFTgR3sbVDa2Wyzz6eCdz0UhoC69q4qQccEjgetw8GuXQHwGARR3NeXxVp
4PCsUEKX5IxcOIKr2/1Y50W4HThACHgvoNAp/GK6zjSuyH17HKgZfSwh+p1sNZ4N
a83mggDEu1rOgsiptGPtO/U+y2pNNnXNqX/+Xsnna6jkCkbM4hnGMLqvvMJlsGaC
iVNyYaPdnO7o3Tqq6wzJbpXH6eKI+g==
=VmT8
-----END PGP SIGNATURE-----

--PPYy/fEw/8QCHSq3--
