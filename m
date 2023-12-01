Return-Path: <linux-rtc+bounces-390-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B91B80103C
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 17:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABA501C20B20
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 16:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7B04CDF5;
	Fri,  1 Dec 2023 16:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olZ1DBNJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC694A985;
	Fri,  1 Dec 2023 16:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF63C433C7;
	Fri,  1 Dec 2023 16:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701448618;
	bh=RnPR+XBq6lWymlucGaXH1Q9fUC0o3QSRY7BPPDl2A/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olZ1DBNJRs1J10iZqvaOwhTBn1G+4W9E1qnGdgYAYiLfukGO13d8GVYduyw5j6ACQ
	 6WeBCrXycQeMWLa/BuVYKdHaSwubOuB13inZWSqmEvtLr3WSJjsfhInatrFjnDUrBE
	 ajP3Mw6AUuh3YqU2haz/WbsWPcyiUM+YHTMMpGBtKwf++YKREoS3E+HmiNccP77HQt
	 PMj2vda64ICsGf3k1xTl3dQjKjKJS4I4JByohsoRJXhmDQtqloq7ByMfm3mNNzsWeW
	 m53cVJ4+jm9bKy3E9GmjFG9mv4hMEuGZus6/kOBxYxqc7IHLS/GakCTxBH0FW+iNn5
	 RLY4jh5xt/CqQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r96WD-0003Dg-3C;
	Fri, 01 Dec 2023 17:37:34 +0100
Date: Fri, 1 Dec 2023 17:37:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: qcom-pm8xxx: fix inconsistent example
Message-ID: <ZWoLzTX0zmCOxsVm@hovoldconsulting.com>
References: <20231130173223.12794-1-johan+linaro@kernel.org>
 <ad96b95a-5f4f-4333-b767-762936932061@linaro.org>
 <ZWmn6uicNIqqSwoE@hovoldconsulting.com>
 <20231201-pursuable-endocrine-1318f4843597@spud>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ry05RoAL5d6Ievs5"
Content-Disposition: inline
In-Reply-To: <20231201-pursuable-endocrine-1318f4843597@spud>


--ry05RoAL5d6Ievs5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 04:27:33PM +0000, Conor Dooley wrote:
> On Fri, Dec 01, 2023 at 10:31:22AM +0100, Johan Hovold wrote:

> > A Fixes tag does not in itself imply that something should be
> > backported, we have CC-stable tags for that.
>=20
> IDK, I think at this point every highly active kernel developer should
> be aware that the stable maintainers backport way more than just what
> gets explicitly CCed to stable.

I'm quite aware of that, and if one of my patches with a Fixes tag is
picked up for backporting when it should not I complain loudly.

For this patch, I would not necessarily complain however as the current
example is misleading.

Johan

--ry05RoAL5d6Ievs5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCZWoLyQAKCRALxc3C7H1l
CGwAAQD4pdhkL7tYkLWSHzoZle5G4pVsi5t0oj4r8gD7HUcCwQD/cP5hu7Utw+ZG
WSjEUNMapd6fy9dBqslr8+BX+/g39wY=
=YNXt
-----END PGP SIGNATURE-----

--ry05RoAL5d6Ievs5--

