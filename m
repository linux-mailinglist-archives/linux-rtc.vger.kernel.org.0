Return-Path: <linux-rtc+bounces-4753-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 164A0B342B0
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Aug 2025 16:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 019E51B21FC9
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Aug 2025 14:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DA32ECD2D;
	Mon, 25 Aug 2025 13:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyraz.de header.i=@wyraz.de header.b="Lo0MoMGT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.wyraz.net (mail.wyraz.net [46.38.234.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5548B2F28EA
	for <linux-rtc@vger.kernel.org>; Mon, 25 Aug 2025 13:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.234.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756130376; cv=none; b=YVFDx2/7f//CBFmKAO7TovjfGIuIy+GBR98Zvxn0ghdFEjEyZsPINNwZ79zCk7cJPn8bKAw5A9Z+sCamTde9WTW9ec7zbt28v7oGl+u/POlbvbl1NJGfrGPGqwUi4fttPXmS+aALHKhyEMtNlFJ/UnBSnaoiLd5eCnIVjh+FpRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756130376; c=relaxed/simple;
	bh=WGG9w3bWOBamcpDhh3ipPD8HyOJx0R/FIsNBkI0i/ao=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=CTRq8pB3Cx0PxMNsFLysv7VhGyHvV70m7iEtlX/1FuQPwF3e7u0LyzJ1nhR/1XwmOABueM1e881iN6KPEFJ9FcXKlLZObJTFGVg7RpHMYa65zD5BvfOf82tCT49H0xLtAyqy1MEIpZnO7bfh/yl+peHS3ZFQ27oJmRDbtya2OXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wyraz.de; spf=pass smtp.mailfrom=wyraz.de; dkim=pass (2048-bit key) header.d=wyraz.de header.i=@wyraz.de header.b=Lo0MoMGT; arc=none smtp.client-ip=46.38.234.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wyraz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyraz.de
Message-ID: <868265b8-4fbe-4d64-86ee-e69b184b6476@wyraz.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyraz.de; s=dkim;
	t=1756129990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qnaWQTEZ8g62ZPbsDg1kN3LNL5XLLxys4cDV3NI2vgY=;
	b=Lo0MoMGT1x1YDEI0162XktEJygvZwcSKOPSaVB3YVb1ygBimXmL/rgYd2ozQRY2A3p6Qh5
	jxd49K1dKYRB2mImY6Cbj4L2U3QZ0WcFgfwXnIKSrDFaAVbe2dN5NVCy/JI/FP0OK98VQ/
	90pzi0V6/4LF6ByqKKQkhRY61D7CAC1UpaTfUqknKpNxpP4PeRsZRNZrRB8d5dUQ9nBb5G
	frlBPblA+hEaual9IT4uu7H6LbShlhDgNAzQ7JYhOCYwygURHe003vNth5IdV+xnOKmmtI
	NSfdjjv30zjKP3OaXX5c/dAh+fyumvlPFRVir7/5TPqR0wJpdU7u+Tg+bvd6dQ==
Authentication-Results: mail.wyraz.net;
	auth=pass smtp.mailfrom=michael@wyraz.de
Date: Mon, 25 Aug 2025 15:53:09 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US, de-DE
To: linux-rtc@vger.kernel.org
From: Michael Wyraz <michael@wyraz.de>
Subject: rtc-rv3032.c wrong resistor and voltage values
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Bar: --

Hello,

while reading through the spec of rv3032 and configuring my device tree, 
I stumbled across the resistor and voltage values defined in the driver:

staticu16 rv3032_trickle_resistors[]={1000, 2000, 7000, 11000};
staticu16 rv3032_trickle_voltages[]={0, 1750, 3000, 4400};

The relevant part in the datasheet for this chip is: 
https://www.microcrystal.com/fileadmin/Media/Products/RTC/App.Manual/RV-3032-C7_App-Manual.pdf#page=45

The values defined there are:

Resistors: 600, 2k 7k and 12k

Voltages: 0, 1.75, 3 and 4.5

So there seems to be wrong values for 2 resistors and the highest 
voltage in the kernel driver.

This also applies to the device tree documentation for this driver.

Kind regards,

Michael Wyraz.


