Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3622B4D4
	for <lists+linux-rtc@lfdr.de>; Mon, 27 May 2019 14:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfE0MSg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 08:18:36 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:35641 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfE0MSf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 08:18:35 -0400
X-Originating-IP: 90.88.147.134
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0F5FCE0017;
        Mon, 27 May 2019 12:18:32 +0000 (UTC)
Date:   Mon, 27 May 2019 14:18:32 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: rtc: Move trivial RTC over to trivial
 devices
Message-ID: <20190527121832.lui2n6vhlemlqy2z@flea>
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
 <20190527120626.GM3274@piout.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lkvgcmvusuvyrlvg"
Content-Disposition: inline
In-Reply-To: <20190527120626.GM3274@piout.net>
User-Agent: NeoMutt/20180716
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--lkvgcmvusuvyrlvg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

On Mon, May 27, 2019 at 02:06:26PM +0200, Alexandre Belloni wrote:
> On 27/05/2019 14:00:33+0200, Maxime Ripard wrote:
> > The RTC generic bindings has a bunch of devices that have a pretty simple
> > binding, with just compatible, reg and optional interrupts properties.
> >
>
> This is not true, they all also support the star-year property, this is
> why they are not in the trivial-devices file anymore.

Ok, I misunderstood the binding then.

Should we create a separate file for the trivial RTC, on the model of
the trivial-devices but supporting all the RTC properties?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--lkvgcmvusuvyrlvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOvVmAAKCRDj7w1vZxhR
xR4EAP4zT5mvMhjADSiQtWNQoHhx4O3WIXNxDlmF2Y/IklLfggEA2KCa9zYz9Tkj
BndNt8yFYR4V5e2m/WBFWOstF9vzFwM=
=E1rs
-----END PGP SIGNATURE-----

--lkvgcmvusuvyrlvg--
