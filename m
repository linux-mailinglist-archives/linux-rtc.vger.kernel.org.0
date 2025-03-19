Return-Path: <linux-rtc+bounces-3552-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EDFA6861D
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Mar 2025 08:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6569A1B62733
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Mar 2025 07:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED5620E024;
	Wed, 19 Mar 2025 07:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Woc8bzi1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F821F0989
	for <linux-rtc@vger.kernel.org>; Wed, 19 Mar 2025 07:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742370314; cv=none; b=UgukHptJzHpxHgUFf8KKi537+wtPr+b0g6RnVl6U6CZFlJHFl5aHCtarXUifvCMETYxjgCwR2wp/bUorYoi/ZcuTddrNfLZsfPAE5d/9NplwuzQuMXOR/JXbNOBECdmue8pdRshMCWyb4ZE6tzK2uMeFCfUkQ/Vo9vaIknOVumo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742370314; c=relaxed/simple;
	bh=Zylv9Pe93ouSZKjjC8dPfUV6KeeGwVHjdraQ+EyfSp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIhAdxfJgpKMuUfV0n3kb6rmUTyIvzgAVIsxFWlS26AWJ9nk2bte7PE6Cd+cJOtdhfC1GkhOhpfd19ezQ4HHvS54bP2n5dxpkoA/UjdHB+QVztBR/0eKwLhEjBRhKoiXKH36SJzEUuWkSbTUxQyDqw/yUDQYFT7FA9nzuWJlphg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Woc8bzi1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=L5Pc
	7ScohVtj6EGcpdPQ7hR+8NtpEik7zfLqi0yNSBw=; b=Woc8bzi1W4hFdEvFENEx
	i2sS4RNtMKc2Z0Zax91Zie/n9y0lEJ1OYyxry9Y7HYkOyubta4+DOBNAuZV/kXJT
	aHWvQGYiJNBX0Dx6AxYrd3cYSZQx4ojewk/aR83UXFgKfiJfJdIXPGpDqQi7/Bur
	sNbqF+eriYDEoVvnTXojzNuKvnFuqEk9A9d6Ug7ML8g+4bwrrk34sFlTXbdZMN8Y
	nzfaHJSh6gbTaphCsuNHq9z3pquvpeVvcxJkWSUKkUHBEfREvs+8TbEMm9IyetwK
	7CrhLGft/g+ZJ0jNobfPLvWdEsa+fznZCe5yORaSqW7DcmRPTqBxYarpWUfRq4W2
	VQ==
Received: (qmail 10110 invoked from network); 19 Mar 2025 08:45:02 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2025 08:45:02 +0100
X-UD-Smtp-Session: l3s3148p1@D0roMq0wbOkgAwDPXyTHAJp038nK7dx+
Date: Wed, 19 Mar 2025 08:45:01 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: rzn1: implement one-second accuracy for alarms
Message-ID: <Z9p1_S3FQDeZmiIo@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
References: <20250305101038.9933-2-wsa+renesas@sang-engineering.com>
 <2025030522061502555577@mail.local>
 <Z8qYM2-LQPgIe2JE@shikoro>
 <20250307183817b7747a66@mail.local>
 <Z86f-tvJ42ui9Esv@shikoro>
 <Z86rueNSSps2foF9@shikoro>
 <20250317222437f14a32f0@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jY3mAlnLOCcRGPOk"
Content-Disposition: inline
In-Reply-To: <20250317222437f14a32f0@mail.local>


--jY3mAlnLOCcRGPOk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexandre,

> I don't this it matters too much because there seem to be very few
> userspace programs using RTC_IRQP_SET and RTC_PIE_ON, muse, tutka,
> twclock, tvtime and mplayer. They are all either very old or this is an
> optional feature with a better replacement.

Well, this list of users is definitely useful, but my main motivation is
an easier to understand RTC subsystem. I just came this way where I
spent some time trying to understand a complexity only to find out it is
outdated and largely not used anymore. It could be simplified. Also,
less code to maintain.

> While I'm reviewing all your other series, do you mind having a look at
> https://lore.kernel.org/all/20250205173918.600037-1-herve.codina@bootlin.com/
> It has been submitted a while ago now.

Sure thing. Once I am done with my RTC task, I will have more time for
I2C again \o/

Happy hacking,

   Wolfram


--jY3mAlnLOCcRGPOk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfadfoACgkQFA3kzBSg
KbZWHA/+PPG+a2LivGfOTBZnJzEHRXBixfLC7239UoPzW/Vl0z6s1MwRn3B+Ao1h
cg+N6LAqNIDghW2kL2/sWWx+dHAXxLjvzN7SSF1rtCRoeO57MV+AR741kQtnc1vM
GNLURAQgo5jGHhPeKLec3AEqr5PGpAvPDSq7f2wP9DnUO0im0LpdWFdnzstul/nc
CEfI+CZQbmfhGqYvQxMcKYibDy1e8LBXTQf3Aa/WNL2ovkOfxXNt89pJmvZhOEF0
AATcvKJ/4hB4O3O0WT1ihFQeinz4HHAKU2zFYWMByuEgsZJJDpICafFGZWiV5/2K
xCUfNmRlgAK2yuzbRP+VK2mddd/V15ybxb5eNlSGOK/uunMHPabVZeBDhnJ8ggUv
WsXRarnHgJ75Gnptb1ebGgI+NCPkpx0zA9zapu45B+SAwwQd5gzmhEJwikyA+teY
haWaXOHKNeA88e38VTfyncjgBHo6zKI0H+Zh1vjW0tS3EHF7kysFdaJMYfwQCkCV
+POCrMUQTopCe9zOZ1xmWL3yr5qbpBZlEQeZPYAIadcwmR4qrsPxR1F4+xWDmQWX
LS59DUYZkHlyMngBVv6+o3zJirrrOTOsDTsolMXsyaMp1mz08xDaW788GL5fkQtL
t5znkSpyhWOYH1tTN8duboWTA6iUbCWXQungPOPU2KEFBXZ03yg=
=1Zpm
-----END PGP SIGNATURE-----

--jY3mAlnLOCcRGPOk--

