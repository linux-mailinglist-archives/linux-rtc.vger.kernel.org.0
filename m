Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD92C142A1E
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2020 13:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgATMJg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 20 Jan 2020 07:09:36 -0500
Received: from foss.arm.com ([217.140.110.172]:59192 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727031AbgATMJg (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 20 Jan 2020 07:09:36 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCA2B30E;
        Mon, 20 Jan 2020 04:09:35 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B87A3F68E;
        Mon, 20 Jan 2020 04:09:35 -0800 (PST)
Date:   Mon, 20 Jan 2020 12:09:33 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        "Guilherme G . Piccoli" <gpiccoli@canonical.com>,
        linux-kernel@vger.kernel.org,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Jie Yang <yang.jie@linux.intel.com>,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH v1 5/8] x86/quirks: Add a DMI quirk for Microsoft Surface
 3
Message-ID: <20200120120933.GB6852@sirena.org.uk>
References: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
 <20200117175626.56358-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline
In-Reply-To: <20200117175626.56358-5-andriy.shevchenko@linux.intel.com>
X-Cookie: I invented skydiving in 1989!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 17, 2020 at 07:56:23PM +0200, Andy Shevchenko wrote:
> Add a DMI quirk for Microsoft Surface 3 which will be utilized by few drivers.

I have patches 5 and 7 with no other context, what's going on with
dependencies here?

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4lmH0ACgkQJNaLcl1U
h9BbAwf/WLuPHY9q8Tq7jRti9DUHNRsH7Ys+k7oM/sAMiV6OmaYgbYVCm7DwbKMV
vZxXGwtIcBxeSc7ZmLpDYLz/xu8V/22A8c4t/ERKcN3HwbMMaewV5C/PAP91HdOw
LjXZnjDD0ac6JJceAEHBzB1NmAeOAS1W8mcckBSrgDSObHQorWNPdgYXLuRLJq7t
aHosto1MOnkOZaz3Gm+eKhi28ZrVNb4ZGrLKuOWyypGuYd5PzUPgsTT0c4hkNk8y
DECEYWSRugoGdnOwEUuU1ctSjq/DkLCta51CaMRn2Z0QyiSmjsL/xAl/1bvFa+oo
63d3fqxqXjR+PcwwUgz4Pzf57hg2Ag==
=2r1u
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
