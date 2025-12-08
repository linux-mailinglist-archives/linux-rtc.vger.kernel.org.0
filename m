Return-Path: <linux-rtc+bounces-5516-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2D0CAE4A3
	for <lists+linux-rtc@lfdr.de>; Mon, 08 Dec 2025 23:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 281A5300D55F
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Dec 2025 22:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449702F0C67;
	Mon,  8 Dec 2025 22:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e6zUFyan"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1032E88B6
	for <linux-rtc@vger.kernel.org>; Mon,  8 Dec 2025 22:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231805; cv=none; b=VJ2qSfZ9qbvJV0TWMTiG6GH1ESwyYjag96OYR+6XvTvzUiNUi2LakRF5UIFEBa0FC8nhJIQU8mOYo/0HBDf384Vdj5x2QMRz+0MTPxX/M4uTOtEQGiFfXN2jQLe7Q8FMxyW1y248VHwTeIe8cxDP0ZkMBB65UJdlJ+B68exGjhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231805; c=relaxed/simple;
	bh=gfYFM8TZgzDduuiSpQZGBHSlOvjR6UivfuFLb5xtC/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GiRRYb1IeyoILWUjb2R82OoxdGeEH624BYbAhifFuxEfBzW5HZeqbGkctVbOtk6xY74pnPF0M5v5uUKVYg0TiG0Du6fvn9LN4upqskhSyF5g4xlg1i+QHEDTsyCTcrUPsUsLlgqyGFpDhKZr6g1AEsQ3Hhiygq8Ec6UGMAZsmOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e6zUFyan; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9CBF74E41AF2;
	Mon,  8 Dec 2025 22:10:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 729C9606DD;
	Mon,  8 Dec 2025 22:10:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93DB6103C8D5C;
	Mon,  8 Dec 2025 23:09:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765231800; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=yZw4AcLBHNo2XBKMHVb0t2bjqlmRcb3KT4PRafjbGKc=;
	b=e6zUFyanY0QmGYjJ+uvzOaQxicsE8N6WHDSXOnnWQz214niX4ZROmlEEPrA29PdMgL4Sgz
	CFNCkc1zHcSdJWf+HPwOO/FnEk8VtP+yFqk/CSipurIs0WWa+qaHiwzweZS0CacDiNRZ2s
	GyZ36IDLLBue4EI8iB+moQsM4USbmLrnivcNNXBQaxvWbYBXyhd+VQiHQQiW9hJOHAfufm
	hf3kSabYuQRmZKmZUWuhY41I9SgWSUnSi3qXD62KU+++tdLt9FDHMTf19eEYPok/gBb2LL
	uiIPhw6JOwlWNfACeIVlcgc/q2/HNc0D88UhARmYsDG27XCBfQ48e/dCQzKVZA==
Date: Mon, 8 Dec 2025 23:09:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Nick Huang <sef1548@gmail.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kusogame68@gmail.com, byron.bbradley@gmail.com
Subject: Re: [PATCH] rtc: s35390a: use u8 instead of char for register buffer
Message-ID: <176523152338.342815.273365090583562629.b4-ty@bootlin.com>
References: <20250920174224.108795-1-sef1548@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920174224.108795-1-sef1548@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Sun, 21 Sep 2025 01:42:23 +0800, Nick Huang wrote:
> The register buffer in s35390a_get_reg() was previously defined as
> `char *buf`. This is not ideal since register data represents raw
> binary values rather than textual data.
> 
> Switch the type to `u8 *buf` to better reflect its intended usage and
> to avoid potential issues with sign extension when handling register
> values on platforms where `char` is signed by default.
> 
> [...]

Applied, thanks!

[1/1] rtc: s35390a: use u8 instead of char for register buffer
      https://git.kernel.org/abelloni/c/73c4638a2864

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

