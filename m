Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F00B2FA117
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Jan 2021 14:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390510AbhARNQY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Jan 2021 08:16:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:60306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404457AbhARNQD (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 18 Jan 2021 08:16:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 191D522B49;
        Mon, 18 Jan 2021 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610975722;
        bh=N0+tVAiwuF8I6w8LmM9DR4Db2xUJ2qKlqrmMh5l6bZg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HvQe3qQl9Q+qTHfN3YaUZnuuPso0FQLFGiDF3YrKlx9Ul8tV24pynj6CKUT6G2u67
         4vg5xFUoKmyUNjcxSaTGq8+gDf362cuBSr3gJzljNRhjO38yghrqWs5rM0CcooDLCX
         /oEiEcTfYcUteOJ0GSiQGH4qhPADCYIl99s0vmKg8wZS0GriSw5/ZaWpTWs8EAX+z+
         l0WcUkFxoc5ZyxAXN3cQVSasV9dU9eBXDijiz51BUlB8M9q7zKeH+FGMMwm/WJN2ip
         dgPk5c9CbKpbMSW7NdjfZaP1ycp2FYqLB18D6HXDxVzrkEemFgh6mnmYr+UhSudepK
         kDLw6j+3yMq+A==
Date:   Mon, 18 Jan 2021 13:14:45 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fei Shao <fshao@chromium.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Yuchen Huang <yuchen.huang@mediatek.com>,
        Ran Bi <ran.bi@mediatek.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH v4 7/9] regulator: mt6359: Set the enable time for LDOs
Message-ID: <20210118131445.GK4455@sirena.org.uk>
References: <1608104827-7937-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1608104827-7937-8-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M9kwpIYUMbI/2cCx"
Content-Disposition: inline
In-Reply-To: <1608104827-7937-8-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--M9kwpIYUMbI/2cCx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 16, 2020 at 03:47:05PM +0800, Hsin-Hsiung Wang wrote:
> Add the enable time for LDOs.
> This patch is preparing for adding mt6359p regulator support.

Just squash this into the previous patch, you're only just adding the
driver and it's not a complex change that needs separate review.

--M9kwpIYUMbI/2cCx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAFicQACgkQJNaLcl1U
h9CSTQf+MLJVFfQZUGnoHLl3SN5QXQPjtmsJepqX3sgPg8KHO/d1P4mBOMVyHZfe
/CRnecyY0Lc0We/d2WkY6FM0cC3sY3JC6juVUdfdxNlmZVxVWReKF7VHLXf/8OWQ
P3aMNUX6uZIHcGJi57fPs7rEamcT94jUFeMQIsi/nRtPY9YgjpUOj0EVY6U92Dsx
DfG2W64Jc3Fd+AZD4hRLxinGcMwMPm6RckTAQmFO9R5KfXs/Qt1vHWo1l9XgZmdh
Hqcp4AGAMs3joVHP+bbbSqZHqmEhfi/kTBRftcum3eXnf1lh3bn3BTTCYD0y46aF
O+MkY4JW53ScIreKEOgqkdrl/xSa/w==
=svi+
-----END PGP SIGNATURE-----

--M9kwpIYUMbI/2cCx--
