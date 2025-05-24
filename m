Return-Path: <linux-rtc+bounces-4143-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5408BAC31C5
	for <lists+linux-rtc@lfdr.de>; Sun, 25 May 2025 00:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 086971794CA
	for <lists+linux-rtc@lfdr.de>; Sat, 24 May 2025 22:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1BE1C84D9;
	Sat, 24 May 2025 22:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FuJ9HtX+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A56054758;
	Sat, 24 May 2025 22:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748125087; cv=none; b=HOIaE+QocZ3pFsRwa3JP5b+46WZH0h52MiiCRUMBFB06d6/Ll+c0mybrHQ2DvsvdlirHRXfwkf7TvX3EicVh5cs3lq/1e/wwojNmCkvoAktGzckDveW2Ph7BylQ/xvoTABYTFyctPeauU16wt0EDkbJ6Ei6RoPqB178bDiGJx44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748125087; c=relaxed/simple;
	bh=Vx9JHKrkStBdftpui/5oFfMrgwuBHQrVeiabhSQv0bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8u+zIkB87RyPybldxdQ8aEzTEyGi/W8UYyKQRUoRjBVMAtjG7X1g9s/+WNJqLrA1nHyjlArJ9NOJNM5o9xTWx6Sww8kIF/STSSfEyEgbdmslpADUiiFX3FiRR3cUUBdocIFIXqULW1RA0i7C6Cux9mgBMjfr6vydqwmKIhwcqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FuJ9HtX+; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CB1A42EA6;
	Sat, 24 May 2025 22:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748125076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FU2dJd6CmPJ04SQRXYMaHcTtEw1U2HT6aBJQicZc5r0=;
	b=FuJ9HtX+CGuh3jP+iX0+DhoEI6xtambRF+ZRZL722NqKsf1LGY4T+C+UUFEOlrOXkkR2+p
	/UhoFAX/nJMA73dhkzwFwlNYan+daqah2XM3g/IvJ68T/StO/1Yx0vn7wwC+LyUWYKeufx
	fsD9IyRzwjcNvlZ9zaPTmfcd7u+tmVt+xMzv3bwKtuNey4tcw2UZCMUdTr8kBq1flQr27c
	8k7dAQUoCSU1vOzih4ElpdVjydaN7kqcdSIrrThSn7BfepbvpH248wW1DN546Kq8wDuCZa
	5GBc+Tgi56FArPQ3CnZ3qJgWw5hpEes+Ww7DPVlzemmpr4xoBjo3lKgrdTIzLg==
Date: Sun, 25 May 2025 00:17:55 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: sophgo@lists.linux.dev, linux-rtc@vger.kernel.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
Message-ID: <174812505586.1272691.391915803033342266.b4-ty@bootlin.com>
References: <20250507195626.502240-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507195626.502240-1-alexander.sverdlin@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduvdekkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehsohhphhhgoheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvr
 hdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhiuhhjihhnghgsrghordgulhhmuhesghhmrghilhdrtghomhdprhgtphhtthhopehunhhitghorhhnpgifrghnghesohhuthhlohhokhdrtghomhdprhgtphhtthhopehinhhotghhihgrmhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 07 May 2025 21:56:20 +0200, Alexander Sverdlin wrote:
> Implement the RTC driver for CV1800, which able to provide time alarm.
> 
> 

Applied, thanks!

[1/1] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
      https://git.kernel.org/abelloni/c/d9f82683b123

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

