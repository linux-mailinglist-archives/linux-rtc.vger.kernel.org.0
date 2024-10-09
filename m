Return-Path: <linux-rtc+bounces-2132-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39517996DBE
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 16:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE86E2819A1
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 14:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B56819CC29;
	Wed,  9 Oct 2024 14:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xs1ZxuzM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A3A1993B5;
	Wed,  9 Oct 2024 14:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728484159; cv=none; b=k9SGeRhCVxnCNGceWw6VmkAiCKLzr37mYjbYluHJFYlNs7ssq03dfGi8q/NfnoNGT9+IiFIm6mE2n3pyou8kPqN2m1ft9KTGMfOQ6esx7D3G3UuLZaWqBxJLCOLWI0eKNGgKEfmXN36ZZZFZgjjVAxXwoUMlmgAZkZwH7cZfHnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728484159; c=relaxed/simple;
	bh=XKGaKz+ENZ9Gnuh3f3BXhAxrWU/spRTX8iydX4EDN0M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o8fsbLg0oNH9NId+smdeyIm864pNi0LVq5CsLjyDgDiCrPCn2ufFWgbQmM5mNfT8O6Rfdd17B+pjG/jC1efEWxB/aeQmyYPmSk+Ws1IBNdCaYDl/vACG2NDjyXTxkskvuJbbwXQHdmjI3TNAYBFbZpUzUHH8eJId6BFhoOJMVPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xs1ZxuzM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC55FC4CEC3;
	Wed,  9 Oct 2024 14:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728484158;
	bh=XKGaKz+ENZ9Gnuh3f3BXhAxrWU/spRTX8iydX4EDN0M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Xs1ZxuzMHaroSZubEOs8XUOu1yEvNxL+WXQutS92J61TwSPZCFVuDU61S2j/jd5R9
	 h0Z0lD7MH2lkRj/qoVuJTIes1RsY7ax7b8bpdENVpFoEGhxNVaKcNcDRMM+6LA1BvB
	 pKAGW6BNnBXKuNstn4QSG/g/vYgbcAjM/YSigLkk8JATSRGR28GCm2AkL+7b0a3kLj
	 EiGgwGHtIvB9jli4/cRLPBOehRxDhgPLbHbUCE6sn0d6kO20FuWCx3Kq30PEsqizYX
	 /kOWeiMSwXhYp/evMTdZQeuVAjO9lUngNnkxNb4BZNu8X2S+QnwyjREhKxPLp1WOkm
	 sJvsI4k2jHHsA==
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Lee Jones <lee@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
In-Reply-To: <ZvVNCfk10ih0YFLW@fedora>
References: <ZvVNCfk10ih0YFLW@fedora>
Subject: Re: (subset) [PATCH] mfd: rtc: bd7xxxx Drop IC name from IRQ
Message-Id: <172848415740.588729.14326036177340227520.b4-ty@kernel.org>
Date: Wed, 09 Oct 2024 15:29:17 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 26 Sep 2024 15:01:13 +0300, Matti Vaittinen wrote:
> A few ROHM PMICs have an RTC block which can be controlled by the
> rtc-bd70528 driver. The RTC driver needs the alarm interrupt information
> from the parent MFD driver. The MFD driver provides the interrupt
> information as a set of named interrupts, where the name is of form:
> <PMIC model>-rtc-alm-<x>, where x is an alarm block number.
> 
> >From the RTC driver point of view it is irrelevant what the PMIC name
> is. It is sufficient to know this is alarm interrupt for a block X. The
> PMIC model information is carried to RTC via the platform device ID.
> Hence, having the PMIC model in the interrupt name is only making things
> more complex because the RTC driver needs to request differently named
> interrupts on different PMICs, making code unnecessary complicated.
> 
> [...]

Applied, thanks!

[1/1] mfd: rtc: bd7xxxx Drop IC name from IRQ
      commit: cd49b605779b4fea8224650eeba70b258c5cc8cc

--
Lee Jones [李琼斯]


