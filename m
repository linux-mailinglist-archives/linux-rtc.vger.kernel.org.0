Return-Path: <linux-rtc+bounces-3224-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEFDA3A22E
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 17:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09EAB189A038
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 16:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5705A26B2CC;
	Tue, 18 Feb 2025 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="SDaHS0yk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tvuYJeU0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BF526B2D3
	for <linux-rtc@vger.kernel.org>; Tue, 18 Feb 2025 16:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739894791; cv=none; b=YmHU7rIfdHXxoPqKcz0M0sZPdS5KuhpG4dfT0KKf02y0gHi2gEXjx9Ho1t+afwsIgZKogOVBvXGaygOFIQuLuFQehK8xMM0mQOqr2gWNNK+vWFX00XVxsg43IbA06uRuuZdwM+kURSnryZC3CFdLJrnXM6N6KEKo0cdiWZPjKcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739894791; c=relaxed/simple;
	bh=OlomkMPXBhbBmF/3/JaqP64nOPyHHAbptgrwKScxjIM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rkPelewBVdPGRqxoDuZa9NDSZUbWY7iPCH978oP9I1j1j8UU2FpQnLNorCUgVvd1EURFv+rZdZhPLtzN9V3sjSN87yuFe42o6nykZmY/1IdBNr8UWGZeZ6TDHfENypIkgmT4LdYBIlySI3Oezp1xzDVe4ZoJArpF6scbEmXUSWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=SDaHS0yk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tvuYJeU0; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 960BF1380A48;
	Tue, 18 Feb 2025 11:06:27 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Tue, 18 Feb 2025 11:06:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1739894787;
	 x=1739981187; bh=fpa5BuNQ1P250p1vvfebguvWRzyq4DWdvJzTAfRti/8=; b=
	SDaHS0ykwWDlmaw8RDji1AHN8GXwNlbMV/K9WaSdk9btavXgec8JGxekjv9Z37RG
	pgsbQUVtMl/5zBOStstUK0WpfE1PrNGcZXMqZfouTNzG62nVKOGvDrpZ+0bws2oR
	QTIO6fevLuCd5aaEgQCX6Bo1Mz4tEgxyhaHbJ/AOSPPdm6LZO/7tdZ0i+FRuTYwh
	cM3uCtT56RnHpiFA28WvVsv6e5zoqhXevtGC1wX9Wr8KVzUMQU1bpl6sAjBFMmxr
	rdMlVbHQKfDkKDaPbx7rJxbctzrnEHSxncDqqE7DSKnmbMowI/iBtxHhct14RHDe
	1OCKf/qcWv0OA7E9EUS8cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739894787; x=
	1739981187; bh=fpa5BuNQ1P250p1vvfebguvWRzyq4DWdvJzTAfRti/8=; b=t
	vuYJeU040fseVwUv28fjV+zmI9G8gHIAzzu2lg2fkRTzLURMz/+v4PyzEikONrLJ
	61F186vMPH+Bbm7SUH2LtIDokfu5s900NiGAYGWa0rsZUNdueC8WHUN/8Yrf8Z1Q
	s+wLz00IL7ixbWItqz3FDYeo/0GdRBa4A2FU+hhpuvz1Z2XHAAZZqdlILOIH3yJh
	A+TZUiC8CSwQn6d8yfzYMbV4UzPIm/lKP0LZleVz2/+AcB+51LsDglsGasmRq/n1
	kehJTs7NUBUhdJZg0xIn+RTthYxMxyXx22aYsbstoc/lxshZN9+GWF/3Lg5t0FcQ
	JVhwkRf/Z6oB3yprTkfsg==
X-ME-Sender: <xms:A7C0Zysjchvw9Gu8EjBZNQt7e7XyAu5jVqOn1xn-K_Sr86bb5qgMZw>
    <xme:A7C0Z3e3yzh8brHSJwZN8A3JDr21ZPXOALyC_2z0tM6xkg3258q-yvLwg9A6q7-7N
    dSjnLjuDT9ngoH39Hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudejgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpedutedtvddugfevjeetvdfgueevjeekleejkedt
    tdejteeuffegteeffeejheduhfenucffohhmrghinhepuhgsuhhnthhurdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdp
    rhgtphhtthhopehtohhlvhhuphhoshhtuhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    eplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:A7C0Z9xfpoBVk34TRrVu4JygW-TeqIuH7Kpasknbek3W7889YyMJAA>
    <xmx:A7C0Z9Pkqaxcm_57fsPmW76YpKkTspWxNX5eika1QPAFTWtvERGdPw>
    <xmx:A7C0Zy_Es1CZbIX8chI2jqXX6i_Sv_CIyJITjN23JlkmGTxw3B0b4A>
    <xmx:A7C0Z1VeB_0F2aekTbWHuQV9EYMMKjfs_Ui3t0ejcrK1oEmPqaIsqg>
    <xmx:A7C0Z0KIm1ZzxHNU8dgzrv_3GqRcgB0kQOgegJVTJ9Zfb5d7_HclLd6C>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4607C2220073; Tue, 18 Feb 2025 11:06:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 18 Feb 2025 17:05:23 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Cc: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>,
 linux-rtc@vger.kernel.org
Message-Id: <baebf0c3-22e9-4b3a-9955-ed27fba708a6@app.fastmail.com>
In-Reply-To: <20250218154057079fa7e0@mail.local>
References: <20250218111150.3024-1-tolvupostur@gmail.com>
 <CABhNV21ZptxH9d4NyPo1xivS0GAXNsoLMLpPSRAsT8h5CX9hDw@mail.gmail.com>
 <20250218133039de7b063d@mail.local>
 <8163c8e0-58d6-44a9-a5a2-6478fe4b0ff8@app.fastmail.com>
 <20250218154057079fa7e0@mail.local>
Subject: Re: [PATCH] rtc: class: Fix max epoch in rtc_hctosys on 32-bit systems
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Feb 18, 2025, at 16:40, Alexandre Belloni wrote:
> On 18/02/2025 15:51:24+0100, Arnd Bergmann wrote:
>> On Tue, Feb 18, 2025, at 14:30, Alexandre Belloni wrote:
>> 
>> I don't know how many 32-bit machines are affected by the bug
>> where they return a random time, or if they are more or less
>> common than in the past.
>
> This is going to break some of the Marvell board that RMK uses because I
> guess he is not updating his userspace.
>
> Also, I'd note that OpenEmbedded switched to 64-bit time_t by default
> just last year.
>
> I'm not against removing the workaround but keeping it doesn't actually
> break anyone, it is still possible to set the time properly from
> userspace as it should be done anyway so I'm not sure about the urgency.
> The impact is mostly about messages timestamp in the boot log, before
> being able to run hwclock or any similar tool.
>
> Or am I missing anything?

The main problem with the current approach is that it suddenly
breaks systems in the future (at the time_t overflow), which is
the opposite of how the rest of the time_t conversion worked.

We now have distros with systemd that advertize support [1],
and we know this breaks every single machine they run on that
uses an RTC to set the time.

     Arnd

[1] https://ubuntu.com/blog/lts-cra-arm

