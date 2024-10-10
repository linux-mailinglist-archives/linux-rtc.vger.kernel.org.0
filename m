Return-Path: <linux-rtc+bounces-2135-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C5D9979A0
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 02:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 060511F21AAB
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 00:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2C0D2E5;
	Thu, 10 Oct 2024 00:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGn0J00H"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80972A1D2;
	Thu, 10 Oct 2024 00:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728520375; cv=none; b=DCV+zrALAmDI5lIEkBTjP76AMsJJJRqhosKVFYTUCCnW8Xr4EKrgfyhT8rIBJc5CxJrm/XTgawMnzn6sN7itJo5Ca9LQyzswyjR+TZ0tD2HSgTwpTxZBeYyzGlIjo3NxeoHnBj+4V2CYY+GtTqTtrdQ+Mv45NhUiOrYLd8eRzqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728520375; c=relaxed/simple;
	bh=QarAG9OsS0S7oXws7XJsQIFCQAcnaMCbtsh+DM35Fcw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YBwI5hacrjs5G900x33xyknx5XzAPvVsrSu3vTIv1XFAjyn2+bUBNFA9H5Z/ytdM93DnUxeNPUSBKzjF74QhtRXaJIh6RFEJK1tMCkvnaFJNzDOZ/HNy/ouCnf+8rygNH/MlgfmhjOOhFpFORNqc6VlSg9mp5t0mwSjq99MSeG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGn0J00H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6633CC4CEC3;
	Thu, 10 Oct 2024 00:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728520375;
	bh=QarAG9OsS0S7oXws7XJsQIFCQAcnaMCbtsh+DM35Fcw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FGn0J00HfbQ3QOMVUqk1P7sFWmH62grr/Lc9+Ar39iMKi+ib9tL6BLhCpOB1ZxllE
	 0MRu42N7V/iGB9cBbdJfiOwSrsdTdPn9NwUypq52PfjxzpFXlkEinsT7EEDfvrNRzb
	 nXmCqlafauZ46G5rrpSPV+rUEZE82Ux0wGJWns13gCl7f/La5N026MaRT4hHcTFvfe
	 tKxX77Y0gwrEKnMPMJYe6QSgQ1FOHg8/8C1cCfAuBbez7m+eCCrHicLjxZzIrFkuNb
	 PVKAHtJnkdlmyu1fKMNRcxPyIZ5CmvG2vp3tw9AP0i1TQBMI9i3oJM27PgPVmhYMrT
	 Km5smAzOMfAcQ==
Date: Wed, 9 Oct 2024 17:32:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Richard Cochran <richardcochran@gmail.com>, Peter Hilber
 <peter.hilber@opensynergy.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>, "Chashper,
 David" <chashper@amazon.com>, "Mohamed Abuelfotoh, Hazem"
 <abuehaze@amazon.com>, Paolo Abeni <pabeni@redhat.com>, "Christopher S .
 Hall" <christopher.s.hall@intel.com>, Jason Wang <jasowang@redhat.com>,
 John Stultz <jstultz@google.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marc Zyngier
 <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, qemu-devel
 <qemu-devel@nongnu.org>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v7] ptp: Add support for the AMZNC10C 'vmclock'
 device
Message-ID: <20241009173253.5eb545db@kernel.org>
In-Reply-To: <78969a39b51ec00e85551b752767be65f6794b46.camel@infradead.org>
References: <78969a39b51ec00e85551b752767be65f6794b46.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 06 Oct 2024 08:17:58 +0100 David Woodhouse wrote:
> +config PTP_1588_CLOCK_VMCLOCK
> +	tristate "Virtual machine PTP clock"
> +	depends on X86_TSC || ARM_ARCH_TIMER
> +	depends on PTP_1588_CLOCK && ACPI && ARCH_SUPPORTS_INT128
> +	default y

Why default to enabled? Linus will not be happy..

