Return-Path: <linux-rtc+bounces-2565-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 331469CF4F2
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Nov 2024 20:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF1481F218A3
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Nov 2024 19:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286D31D79B6;
	Fri, 15 Nov 2024 19:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J7QM98w/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ADE1D460E;
	Fri, 15 Nov 2024 19:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731699372; cv=none; b=RaBN+uGc76Y5E6WGGBQmdk5ydMEwFQzKieSTBS2ptRbawfBdOL5AT5H2s1AOz80Rmgv+NqtRjy6UuKpyPIaazdQcb4XSnQakae47FB2kBQFzWcYCiO/s07Vt2Ay+Ux83rZeaF5o6NpbmTedXAb9eKt001bt2tg11BltT1HNnPv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731699372; c=relaxed/simple;
	bh=cz/A7iUedMEu2NWll2rSLDlSAl+o8O16VpSMVDD5nkE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mp4qgA+JAeb65bA58lDnHIimf491cupZAXbO+oLD91740eg3KKEESC93yNP+71k5OQvJzKWQdaUlNMI8iB5fOi1y3l6y+KHHeWyicP/oz5NZWff81MNNdT9kq1P1mQ8bcVxx1W/URRTvY4IGkrW8G27kOugFIHj70I9gQe1qwjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J7QM98w/; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DCD5C0002;
	Fri, 15 Nov 2024 19:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731699366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cz/A7iUedMEu2NWll2rSLDlSAl+o8O16VpSMVDD5nkE=;
	b=J7QM98w/25F4MtlKNtxLsQPI4u5vENlBdvckAoKwFQrL2PZJlGmCcOtGbVBTSCj/A82CG1
	HxO/JOnfnRpENTPVFaqi+b43kGDWXlWNTGADaSmFI73vJImNcY9tgYvRuQP9jUBdSZHMlP
	iFI6CyTyWTysLUGenHJomJGkoYkyntXM95IMr8rqqSlbEOlWFwmoUSMQqwqfJ61A0tQpKM
	3HUs7Prueutsl1UKDPcZdGeMJ5FeD9OcN6lphSF0VVQ41p/iIXtJB1U90X4QRkC1kkrrFe
	+tU3mr6VSpdbUaJoiOPWAz70T3nTZLNj9O80xarxKT5TOSkt1lYzPTKgeeBpIA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Michel Pollet
 <michel.pollet@bp.renesas.com>,  linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: rzn1: fix BCD to rtc_time conversion errors
In-Reply-To: <20241113113032.27409-1-wsa+renesas@sang-engineering.com>
	(Wolfram Sang's message of "Wed, 13 Nov 2024 12:30:32 +0100")
References: <20241113113032.27409-1-wsa+renesas@sang-engineering.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Fri, 15 Nov 2024 20:36:05 +0100
Message-ID: <87o72gnvbu.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Wolfram,

On 13/11/2024 at 12:30:32 +01, Wolfram Sang <wsa+renesas@sang-engineering.c=
om> wrote:

> tm_mon describes months from 0 to 11, but the register contains BCD from
> 1 to 12. tm_year contains years since 1900, but the BCD contains 20XX.
> Apply the offsets when converting these numbers.
>
> Fixes: deeb4b5393e1 ("rtc: rzn1: Add new RTC driver")

Should probably be Cc'd to stable?

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

