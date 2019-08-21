Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4722977D2
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2019 13:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfHULVq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Aug 2019 07:21:46 -0400
Received: from mail-wr1-f98.google.com ([209.85.221.98]:38889 "EHLO
        mail-wr1-f98.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbfHULVq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Aug 2019 07:21:46 -0400
Received: by mail-wr1-f98.google.com with SMTP id g17so1664378wrr.5
        for <linux-rtc@vger.kernel.org>; Wed, 21 Aug 2019 04:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mTkqcGyySub3rU7JsY92lmPUU47FlZDCEGOUZSs/WZg=;
        b=Z8C0FYONP4zt5EEdMd7oslFxQ7Fpn5vf2kvFw+ODUev0uBr/2ZNQ0cLc16UdScmAT5
         4RLnorazQjac7aaYgABBAt5TeO3CX8jHXtk0S8D4iatoCRsIrYFtNVkg9D+bssSUISl9
         GqE54vLSbdbO0bKvOO5RRnqYRp4PqQGA5AooyVeWe+jUokKB5mqPoENL7y1M5TvWVPy4
         0EylrHutbtIXn74hrYSCxyqdwSR3cKdGjaeplMSAqEXDJ+M71FJgJNthZxGplIiwGpIn
         j0QNd4x2ofoxEcEg5m+ohB9jKO+Xlb1yweYASgCHZlVl5pCR4A1ZvgOMSCx/vnmH//Zk
         NFJg==
X-Gm-Message-State: APjAAAWlyds4iPlZVpZCh+TfXIGq09iHS+QbtzqGAO6d+WRgQYVxbXwq
        xdcLvR8AoJLMLXedJqsFMoln1IrDfJBMBag0jcIkqjewaFN3eW4yFlMAmwOKZZ+FiA==
X-Google-Smtp-Source: APXvYqx/m5jONrRM5+hxgwNQNzxXpK3s0HHgx/GWjPpNwA1ANmuT+Uk4cVaMerRrvOlL/ZynbuZ0YzvU0et+
X-Received: by 2002:a5d:5388:: with SMTP id d8mr39936469wrv.299.1566386504059;
        Wed, 21 Aug 2019 04:21:44 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk. [2a01:7e01::f03c:91ff:fed4:a3b6])
        by smtp-relay.gmail.com with ESMTPS id k7sm21126wma.7.2019.08.21.04.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 04:21:44 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i0OgR-0006vg-Px; Wed, 21 Aug 2019 11:21:43 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id DA57A2742FCD; Wed, 21 Aug 2019 12:21:42 +0100 (BST)
Date:   Wed, 21 Aug 2019 12:21:42 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Li Yang <leoyang.li@nxp.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        nandor.han@vaisala.com, Biwen Li <biwen.li@nxp.com>,
        a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [v2] rtc: pcf85363/pcf85263: fix error that failed to run
 hwclock -w
Message-ID: <20190821112142.GD5128@sirena.co.uk>
References: <20190816024636.34738-1-biwen.li@nxp.com>
 <20190816080417.GB3545@piout.net>
 <CADRPPNRkqbWzGEvUJyi0Qff3oS6biO0v7BTrK1Jiz9AMnOYF=Q@mail.gmail.com>
 <20190816162825.GE3545@piout.net>
 <CADRPPNQwcGrVXLm8eHbXKmyecMhT6Mt9rNGnspJA1+MnV4K8oQ@mail.gmail.com>
 <20190820182224.GI4738@sirena.co.uk>
 <CADRPPNQ__XRW74e+Dq0BEjJq-onVi2dmb7qKrn2Lt_xr50VCCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6Nae48J/T25AfBN4"
Content-Disposition: inline
In-Reply-To: <CADRPPNQ__XRW74e+Dq0BEjJq-onVi2dmb7qKrn2Lt_xr50VCCw@mail.gmail.com>
X-Cookie: Sic transit gloria Monday!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--6Nae48J/T25AfBN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 20, 2019 at 01:33:14PM -0500, Li Yang wrote:

> Some of the RTC hardware has the capability of address wrapping which
> means if you access a continuous address range across a certain
> boundary(could be the boundary of a regmap region) the hardware
> actually wrap the access to a lower address.  But the address
> violation check of regmap rejects such access.  According to
> Alexcandre, the address wrapping is essential to the functionality of

It's *essential*?  Will innovation never cease?

> some RTC devices and can improve performance for some others.  We are
> wondering if it is reasonable to have regmap support this address
> wrapping.

I guess, I don't see any particular reason why not unless the patches
are horrible or get in the way of other stuff.

--6Nae48J/T25AfBN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1dKUYACgkQJNaLcl1U
h9AhxAf/SzoscwNnqLNxy8Qh0kTd3PTGqyZ/xz2tZLKrnHDuRO0aKwkMRTdM7Gzp
Uiw2ICFK6FMwpnR0BS2FTziLRaDCt/5YB+xbIJNXdvzfTowo1WA6JYix9BVEDygI
9ruS2Al2/7+jUswYDLQvYsQeCPyQwBVPMiqytbx7Dqy/7I53cQiD9/IGgXKZu6gO
XS8bDZrr91isx7NEjK28wExf8uiDyOE4Pr8Rzo9KV5kq/cDeLXLD75jLARHAPyvT
ayREc75sMJ9GKb8ReizxE2CxzOap6OohWj9Fn5525bV1zmPQMffquqx+LUbdrqEH
paQds3tvYDpii/nEJqeaIfl+X8z/AQ==
=FHDv
-----END PGP SIGNATURE-----

--6Nae48J/T25AfBN4--
