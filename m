Return-Path: <linux-rtc+bounces-4399-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18462AEEAA6
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Jul 2025 00:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5983A17F65F
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Jun 2025 22:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132EB242D75;
	Mon, 30 Jun 2025 22:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="XdkZAKgu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BOkeg6+Z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FE920103A;
	Mon, 30 Jun 2025 22:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324092; cv=none; b=OyL4NXBE+Tiys9rt/uPOa2npeckSopYC1suc0fmHOr2QYSfiD+2XSSyBblVMo4OzWyeYu0PQo2PYZWBRIpDWtNtm70wEQ3f1N2YO99mwzuwhAnyp3C+gilubZzMODZ/6dfwAYf1W78npq09qErjiHjaqniYSAmgOgmJwj9mjPA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324092; c=relaxed/simple;
	bh=Bx6G+GZnSuW/ym92BMhIICdOgvLhidW0IsEhM7+t/lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCvQj27OE6b3T7w3PM1lEAUooe/9oMZjt2Gk0hdhwy7uLsXuBFDCRgBdOXIOIiqB/xagCSKXyIe14s4N2jH4uo1KI94SIB8lK7kjSi5Z2lyQg0cgqL/WuFX23Qc8N/u5mpbZuqTO2lTIq+I55Ri5VBoAjz4R0LtoczJZ0CmRj9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=XdkZAKgu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BOkeg6+Z; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id C7EA8EC04A6;
	Mon, 30 Jun 2025 18:54:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Mon, 30 Jun 2025 18:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1751324088; x=1751410488; bh=aDxAWQha8L
	UIuv4vcmXxHDWbyTtKBRFdq7D4Fzb0AD4=; b=XdkZAKgu/9u5x98IsBuvUlN9bt
	SUeLGBzmev7FPnd1udripRYgRykLn2SXGA5wxUo0T7ZNU1oHxkyEu2JdA2Ax6p9O
	iH/KJqeXp1aRiBFAkHuJlzwpA4GQJyEPxYDgMKKLfpcB5RCVUjtYjBrFjxAYdu55
	zu0kibAQbJ6m1WAcZimB1CiDl2faeZxS6LInr+nhrCfV1mghEQOf3oWA9egkG9Qt
	CRmh/HYbi058wsVuMTkVdnrP44TaMr1IZ1CCCaUJiLqIA1/W8RUqNnn1uCErAQnm
	zRwu3vUrEy4OSIGhwnkNfWkKWPEvw0bQ6KE4FbpgWwNm7evfhwj22NdOeZZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751324088; x=1751410488; bh=aDxAWQha8LUIuv4vcmXxHDWbyTtKBRFdq7D
	4Fzb0AD4=; b=BOkeg6+ZOCSO74Jud5GKAXmrIPqwyxbUM63oHkMfYAoyS7eEfGB
	dcctu5/C3Qa+DYmee/jj+F0GidtSasgJSJsrs8aRtqJzjNGV09aG5fwaDRYesXtd
	Iwua439Io8/m7D7zdzdyYUUi+GNdmiziaMHn1AXd/dhgJDcCLND+Sx3Fy9VelXMP
	vevTK5pW4gBbuKMhAY9M8AXug2SaJvoQ3Q+HDTllMOZToBvRIMqQrzoH646lhPgS
	47QqIOtN5MyvujLCHnYZDGsEWQaLXeeOUuebHIAAyUfFbudGKnPNMjGVdbB9Un8F
	Vfb+x72vYb94eT7N/Y+12gLxpIZ2klStFkQ==
X-ME-Sender: <xms:uBVjaOI-rFUMDBXE2FbOf-9X_QOAteUDf1LZybeIFejKC_kb5abkZQ>
    <xme:uBVjaGLuI3fle84rc88mdfvMqRTdcUQhNz1S3khcrypYQWL0t82J8EhImoiIdgb3Z
    3rpGTTyTcvg2fjn9ro>
X-ME-Received: <xmr:uBVjaOvjMLhV8i1EQIeiJAH5kRerkccLjfJqVgEcVzQkI4h_4LJfjHhBDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdelhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhihlvghrucfj
    ihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpe
    dvhedvtddthfefhfdtgfelheefgefgudejueevkeduveekvdegjedttdefgfelieenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohguvgesth
    ihhhhitghkshdrtghomhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepmhgvrghgrghnlhhlohihugeslhhinhhugidrmhhitghrohhsohhfth
    drtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhl
    ihhnrdgtohhmpdhrtghpthhtohepghhiohhmvghtthhisegvnhhnvggvnhhnvgdrtghomh
    dprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:uBVjaDaZHYUUeGsyC75tk440mlmwDjjzhD0rY3nXkcDEYBUgdBHdPQ>
    <xmx:uBVjaFaETJP_8PbAMmLIsAwpI3OCwNVbGROHKWl5L6I2yeN_nNBQUg>
    <xmx:uBVjaPA4qIonjnFryUREDw6L3VlyDvvhDzRYkG_NrJIaG1mT65BYCg>
    <xmx:uBVjaLZvpTyWmkwpqFIhBH4O_g2i6tcJ5iUiKsiiWfr7gi9dXGAXLQ>
    <xmx:uBVjaBYRBTt2t8ReVcBQCCOcA53P_jEP0rigiBJ1boeEr6T0x3sBYV-l>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jun 2025 18:54:47 -0400 (EDT)
Date: Mon, 30 Jun 2025 17:54:45 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	alexandre.belloni@bootlin.com,
	Rodolfo Giometti <giometti@enneenne.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Expand oscillator stop flag (OSF) validity check to
 ds1341
Message-ID: <aGMVtfwB5gmBuW4T@redbud>
References: <1749665656-30108-1-git-send-email-meaganlloyd@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1749665656-30108-1-git-send-email-meaganlloyd@linux.microsoft.com>

[Adding Rodolfo Giometti]

On 2025-06-11 11:14:14, Meagan Lloyd wrote:
> We would like to use CONFIG_RTC_HCTOSYS to sync a supercapacitor-backed
> DS1342 RTC to the kernel time early in boot. An obstacle is that the
> sync in rtc_hctosys() is unconditional as long as rtc_read_time()
> succeeds and in some power loss situations, our RTC comes up with either
> an unpredictable future time or the default 01/01/00 from the datasheet.
> Syncing a future time, followed by an NTP sync would not be desired as
> it would result in a backwards time jump. The sync feature is useful in
> boot scenarios where power is maintained so syncing only when the RTC
> data is valid would allow us to make use of the feature.
> 
> The DS1342 has the oscillator stop flag (OSF) which is a status flag
> indicating that the oscillator stopped for a period of time. It can be
> set due to power loss. Some chip types in the ds1307 driver already use
> the OSF to determine whether .read_time should provide valid data or
> return -EINVAL. This patch series expands that handling to the ds1341
> chip type (DS1341 and DS1342 share a datasheet).
> 
> These changes enable us to make use of CONFIG_RTC_HCTOSYS as they
> prevent the invalid time from getting synced to the kernel time. It will
> also prevent userspace programs from getting the invalid time as the fix
> cuts it off at the source - the .read_time function.

These two patches look good to me, although I'm not an expert in RTC drivers.
I've reviewed the DS1341/DS1342 datasheet and the approach that Meagan has
taken makes sense to me given our (Meagan and I work together) desire to use
CONFIG_RTC_HCTOSYS and the need to avoid syncing from an invalid RTC state.

I've added Rodolfo because he first added the logic to clear the Oscillator
Stop Flag, during driver initialization, way back in 2007 with v2.6.23 commit
be5f59f4b67f ("rtc-ds1307: oscillator restart for ds13{37,38,39,40}") and may
have additional context to provide.

Alexandre and Rodolfo, does this approach make sense to you? If not, do you
have any other suggestions on how to make CONFIG_RTC_HCTOSYS work with this
driver? Thanks!

Tyler

> 
> Meagan Lloyd (2):
>   rtc: ds1307: remove clear of oscillator stop flag (OSF) in probe
>   rtc: ds1307: handle oscillator stop flag (OSF) for ds1341
> 
>  drivers/rtc/rtc-ds1307.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> -- 
> 2.49.0
> 

