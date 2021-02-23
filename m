Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56D543223BF
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Feb 2021 02:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhBWBdo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Feb 2021 20:33:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:39384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229967AbhBWBdn (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 22 Feb 2021 20:33:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D55B960233;
        Tue, 23 Feb 2021 01:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614043983;
        bh=SidThf39RHR584VvQ2PFUpvKbaI6ZS/1pOYS/H0qYgY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kv5Rpg55CfBeqg69qrft4n/IYgjL4QVqpK7mb6WIgQDcaM0sTLPTOVfK5qxSzy70S
         SGd/KiYm+SpyMohMIRc8d8ZHCWbIgEFhiI40yzd9TWIqqnVk0E86B0/eDFc/L0bwTs
         5Seqoyxxmc0pp6tJVWCNuWpjhjpR5NFHrUsPY5rQ1PMcM4vvG7q+cGfjCeroXRf/gP
         3XGGePnqCmqAvISX2PRCzIt+OJ7EuA8VxHIOag8ozHLIBZF5J3K7OytEh43cB5OIZw
         PdVpClLlcKCSR8Y5YDfADTKacEd98t/cBj7k0ZYbpY5HEhJfNS2aeZDbUNjBYZXOC7
         8Bzh19ZQDOkBg==
Received: by earth.universe (Postfix, from userid 1000)
        id 9E1313C0C96; Tue, 23 Feb 2021 02:33:00 +0100 (CET)
Date:   Tue, 23 Feb 2021 02:33:00 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCHv1 5/6] dt-bindings: mtd: jedec,spi-nor: add sst25vf032b
Message-ID: <20210223013300.ouwilfkk5hyyhzdi@earth.universe>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-6-sebastian.reichel@collabora.com>
 <CAL_JsqLmcRqFW5ufy-zY9dfqpiwACxfOHrrGphTx2UGMBVj-7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="peq7earpm2cetdte"
Content-Disposition: inline
In-Reply-To: <CAL_JsqLmcRqFW5ufy-zY9dfqpiwACxfOHrrGphTx2UGMBVj-7w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--peq7earpm2cetdte
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 22, 2021 at 06:15:11PM -0600, Rob Herring wrote:
> On Mon, Feb 22, 2021 at 11:13 AM Sebastian Reichel
> <sebastian.reichel@collabora.com> wrote:
> >
> > The binding is already used by the driver. Update documentation
> > accordingly.
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 1 +
> >  1 file changed, 1 insertion(+)
>=20
> This is now DT schema format. Landed in Linus' tree today.

Indeed and it already contains sst,sst25vf032b.
This patch can be ignored.

Thanks,

-- Sebastian

--peq7earpm2cetdte
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmA0W0wACgkQ2O7X88g7
+ppMiBAAnBRRR4ntus9a9JePpyG2+61admQniYXmvTJtKohNBG1463YJj+URPhBv
4EMUHj4Mkmo5SPrSyEcIpal00Hb0+LOP/KwTCvHNrbGRp4myzc15+l1fErFNh/ya
81RWoUagWwhPeQZhkumO/69Hb+j/wj9iSQfl72VwzmQaQeJ0X/xh24ONlIL5M7xP
Yk7P3j+YULsFM8ZZnpyAfxSnYS/okRrvOr70nrHGLrtfBd9mHV/JtOMXHWepInAc
4Ar852HZQI2lbtz6dXZnIFsq5VfEw+pczi7YtnduHbz95idImndViMk982jx9zFz
GkTx3MSxzM/xOZxzrJq8iPHdLIguV0DW5Q7p5hygjcox79ACQw+iTMHrbzf/rZPa
QXAMRnb/Gr1Q48LOqgSmT9Qk/ALFg2Y3QjOlJYlC9/9f6S5S53FY/4XUatqmvz5/
LbsgFHWceif6LL6m7KMoKgHvPiKcY3MP2LDkXSni8gxQLqNF6hWav70jJ9fXcEsZ
3hgHuGBii0pX6MXl7jxu7qCD8OQ7cUCITJSD/gx6Jgr+CflDEYZWRDgu1x0RyqFI
QQc2F1EcQ1EBmeC7JZfQAx3gf++BFVVW1WkaI9pHZwzKigBW8+UdEY9kEtJH3Fvt
JIM7+72d80QDfWZvJpa81fltQfRwHWLDwkmaFZfEF4sWrqkOmq8=
=+yJ9
-----END PGP SIGNATURE-----

--peq7earpm2cetdte--
