Return-Path: <linux-rtc+bounces-2435-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FF99B94C3
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 16:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DA8D282139
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 15:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26001C760A;
	Fri,  1 Nov 2024 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iiifxyti"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E05145A17;
	Fri,  1 Nov 2024 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730476395; cv=none; b=omvYw2CLvk1j2FoUQUsHQRcq7f1Te1ufjmWQdWb64snbJ0WJvnHkaBwsHQNZNLXNUirWotJwXngXmODr3vttUwU7mn3IsYBjSqN/+/q4+AiiCk2Erm3ZK3UHtuzcZdtXTqgZ8hV06KPR7tKb2adTxEg69FdSXZFmzfkeL3TJjg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730476395; c=relaxed/simple;
	bh=bqtiD4+xA8uLNkzo3xFeE4uK9IwkCr/YgjE4MRB2pk4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lvdKza0bdVJFhxJNHovGRx8VHbfn+1DFRwUdawLhTGNbfrAkjjHX/HANFFHGYZGBlN3Lh4kzX78xJxvVYQku1IxrIKc8A196T6+JofoT0gIvMrCYRBo7cFdcClfkfFOwfZdNk/HKLWsWst1RSx98clsVlgLlXg3IQBwTx+c2dGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iiifxyti; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AAFC4CECD;
	Fri,  1 Nov 2024 15:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730476395;
	bh=bqtiD4+xA8uLNkzo3xFeE4uK9IwkCr/YgjE4MRB2pk4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iiifxytiUpwrjM4t7fDAZaCEfQa/WMwH2afgkICn2VOlexqzwyGSly5Ig/ifTDkGb
	 z5LbpZZ2cpYVQsiqUvoNGdVX45UTkiUlbbvVanXTHmwsuMXPdJZFov9/PwmHFJeEL2
	 iDiyiNnSBi0+VhQRgbExToz7RgSw/+c5rOfNmdSaiNYsDnqDTxVdgk6I+Aj5vMxaf3
	 K75T4KZnXUBj9mnD32UmHjlRMIR8IPFRZ7rgNkeTSeQmQXtLU5Kah8+6qvLXEm0pTm
	 M4Rj93kQaqpGY/ymLbOaO0NfTC/ag08N8IEYqI7aQ5uNbP8+o65pmyv9+/MP2nlklP
	 8hNk9MAf674BQ==
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Lee Jones <lee@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
In-Reply-To: <ZvVNCfk10ih0YFLW@fedora>
References: <ZvVNCfk10ih0YFLW@fedora>
Subject: Re: (subset) [PATCH] mfd: rtc: bd7xxxx Drop IC name from IRQ
Message-Id: <173047639404.1919496.13548454425529763566.b4-ty@kernel.org>
Date: Fri, 01 Nov 2024 15:53:14 +0000
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
      commit: 9b15062cc05dbfec8092f5f08ac734fd29ed7b5a

--
Lee Jones [李琼斯]


