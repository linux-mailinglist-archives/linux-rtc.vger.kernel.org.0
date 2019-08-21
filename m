Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67907977F4
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2019 13:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfHULac (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Aug 2019 07:30:32 -0400
Received: from mail-wr1-f100.google.com ([209.85.221.100]:43918 "EHLO
        mail-wr1-f100.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbfHULac (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Aug 2019 07:30:32 -0400
Received: by mail-wr1-f100.google.com with SMTP id y8so1668688wrn.10
        for <linux-rtc@vger.kernel.org>; Wed, 21 Aug 2019 04:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lX8OK4lw2mSaArlQhylN2j6glOuN8geLPKNWACNmoxs=;
        b=VQCSsSn0dZRoAwR/icgVwPzYqYVa4BNu5HmrFD9xwRlToMLZGHYUgqo+fi2Vdy2ZOB
         mj89OD8fBix5hDd0RCmFdElsyLb0y2mNglpa554VRfC4lC4NYHLe3oKfSyHntYWOv/iF
         OzOLlInAjNAq6RrPzcu0pDWHTfiAvAhIfyX/95Z490ZCLdX9InDOZ6cBVQHBwJBXCoKA
         8Qy5rKjdCr6jZJewgv5yHu3cU2atsgkCAusiIAK7xuZ/TwjxzRxEz83etO3Cq7jBPENK
         X7Tiahz217Sr5dkTgLtJUnh+wy/co+YAT9BX//4UQ45fITj4oTPynZE27JVIeaxAyBAC
         cP+g==
X-Gm-Message-State: APjAAAWkAZyhwp+vZUSNO5lYWUwli9j25EO7cdJaxZ7k8ij4Sl3c/3oV
        Ni9g7dIt16Cj2benl/iU+CG5km7YrAi0qKvLCVEaf/ka/CIpHEjvwx+3j3DI0dGIsQ==
X-Google-Smtp-Source: APXvYqwvTyTDb6VFbY2EqaFvWbValAURyRt87hzPT4tfTUSHu4/Nzwme2MpyRbHAexRUvenclaER0MUo0iBs
X-Received: by 2002:a5d:414f:: with SMTP id c15mr11194539wrq.248.1566387030279;
        Wed, 21 Aug 2019 04:30:30 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk. [2a01:7e01::f03c:91ff:fed4:a3b6])
        by smtp-relay.gmail.com with ESMTPS id h15sm29024wml.50.2019.08.21.04.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 04:30:30 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i0Oov-0006xA-Vq; Wed, 21 Aug 2019 11:30:30 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 2F53C2742FCD; Wed, 21 Aug 2019 12:30:29 +0100 (BST)
Date:   Wed, 21 Aug 2019 12:30:29 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Li Yang <leoyang.li@nxp.com>, nandor.han@vaisala.com,
        Biwen Li <biwen.li@nxp.com>, a.zummo@towertech.it,
        linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [v2] rtc: pcf85363/pcf85263: fix error that failed to run
 hwclock -w
Message-ID: <20190821113029.GE5128@sirena.co.uk>
References: <20190816024636.34738-1-biwen.li@nxp.com>
 <20190816080417.GB3545@piout.net>
 <CADRPPNRkqbWzGEvUJyi0Qff3oS6biO0v7BTrK1Jiz9AMnOYF=Q@mail.gmail.com>
 <20190816162825.GE3545@piout.net>
 <CADRPPNQwcGrVXLm8eHbXKmyecMhT6Mt9rNGnspJA1+MnV4K8oQ@mail.gmail.com>
 <20190820182224.GI4738@sirena.co.uk>
 <CADRPPNQ__XRW74e+Dq0BEjJq-onVi2dmb7qKrn2Lt_xr50VCCw@mail.gmail.com>
 <20190821112142.GD5128@sirena.co.uk>
 <20190821112413.GA27031@piout.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J4XPiPrVK1ev6Sgr"
Content-Disposition: inline
In-Reply-To: <20190821112413.GA27031@piout.net>
X-Cookie: Sic transit gloria Monday!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--J4XPiPrVK1ev6Sgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2019 at 01:24:13PM +0200, Alexandre Belloni wrote:
> On 21/08/2019 12:21:42+0100, Mark Brown wrote:
> > On Tue, Aug 20, 2019 at 01:33:14PM -0500, Li Yang wrote:

> > > violation check of regmap rejects such access.  According to
> > > Alexcandre, the address wrapping is essential to the functionality of

> > It's *essential*?  Will innovation never cease?

> To be clear, for some RTCs, its is the only way to accurately set the
> time.

What's the mechanism here?  It's a very strange thing to require.

--J4XPiPrVK1ev6Sgr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1dK1QACgkQJNaLcl1U
h9Ayhgf/XhM7dhJYY6RazezOq9Nl3U6x8jy2f48DgsiJz0ayCQnPPMIhyp0YRd68
UMMq45/qttkREr04v3OjOo9FIPbCkkL/47+oz8aZ02YX93ip/cU4B0NvDojfSOx2
bI3UK2pKnbM0qWhdQFJj21sUmZoN3FRcHPJv+b44aPj/CxxkC8K/XDluim+YIUDF
fmgAtYUTZl66b2lGIUxYoyFp7tM192ZHk4wsINg1lho1PXVaDyBN9fYYXP8iPxaY
1AtnDJObrGHHOUlzYeo3zLafqSFNL3/gWYzFKj/c6rAbAiItOxzhNawqcJ7tjzyP
qLd9YlmqIWKSLQzTjbRexnU1XzhInA==
=KziT
-----END PGP SIGNATURE-----

--J4XPiPrVK1ev6Sgr--
