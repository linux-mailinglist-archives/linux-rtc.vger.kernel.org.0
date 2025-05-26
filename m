Return-Path: <linux-rtc+bounces-4160-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A9CAC3D90
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 12:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE4737AA195
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 10:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A519F1F2BAB;
	Mon, 26 May 2025 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EQyNF7Qq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D304B1F2B90;
	Mon, 26 May 2025 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748253730; cv=none; b=lBMjHiAZg9zySx7b4Q9uA8Fpo0COxbngRMHf5q0Qy4r5giglUgp8X4fLsULkqrH7EEZQ7QwWmOC8Aie8XEfnrIuZHiJ8r1IIngC9gBSfNWf8OKDlmfhvXSELgyBL+84xuApWp2rEwmTjkVhuAOpuloNa94ShAxLgj/oAtqAT7o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748253730; c=relaxed/simple;
	bh=cBn6HX3EUnlTlmhjv5Lczo+KxuUQo+9M1+1vNTzl9A4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GwqVFjDB1Q77qSh6OCzFrtsKI52kPi85qNaTk4hiky1jV29QyZSslwwtlcxmYdtpJJp32k5Lb9cGkkcz9rjLSYpJ9pMHvIcHxU+xDjohcSdgoxBCaqYytt7QKJRXC3kY4FHAnrijRccLNMm3mcNkOKmQPXJobkUu93aq8SOC6js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EQyNF7Qq; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4A2A43277;
	Mon, 26 May 2025 10:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748253726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBn6HX3EUnlTlmhjv5Lczo+KxuUQo+9M1+1vNTzl9A4=;
	b=EQyNF7Qqhg8xf9c13Fi+OxnNTN1hYLerd5hrmQTNwqTEd7p2KokRQlbXRSwh0/PvDygooU
	3yuICRBOKeIxi9mvb6WGkecUli7fdlPpMwequS0UW3eBnrRIPx/6+l6m9H/YTjk1PZhbL8
	MtHuq+pSILCG871IYdUn6DmzwKlSBxYz4F038pNROc4antlFcp5JlwBC9jqXxI5W6uFi5n
	TwGsninsroGFDkL9KqEMCT2zRcYjs1/fVSKLEHzwLbmp0hbR/TDHtnEBCbWmaf8DYY/deh
	3Jc8BnDVCP5m8vqg3Uk9QNycG0i/iSpGVeRnkBNA52LW8WMA90S090RmIh7GqQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] rtc: rzn1: Disable controller before initialization
In-Reply-To: <20250526095801.35781-7-wsa+renesas@sang-engineering.com>
	(Wolfram Sang's message of "Mon, 26 May 2025 11:58:03 +0200")
References: <20250526095801.35781-5-wsa+renesas@sang-engineering.com>
	<20250526095801.35781-7-wsa+renesas@sang-engineering.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 26 May 2025 12:02:05 +0200
Message-ID: <87sekrzo4i.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujedvvdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvr
 hdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

On 26/05/2025 at 11:58:03 +02, Wolfram Sang <wsa+renesas@sang-engineering.c=
om> wrote:

> Datasheet says that the controller must be disabled before setting up
> either SUBU or SCMP. This did not matter so far because the driver only
> supported SUBU which was the default, too. It is good practice to follow
> datasheet recommendations, though. It will also be needed because SCMP
> mode will be added in a later patch.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

