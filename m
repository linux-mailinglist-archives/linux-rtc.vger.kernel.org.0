Return-Path: <linux-rtc+bounces-2459-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1999BC318
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Nov 2024 03:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 848351F2285B
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Nov 2024 02:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1715674D;
	Tue,  5 Nov 2024 02:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpFh/7Eh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7467D51C4A;
	Tue,  5 Nov 2024 02:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730773226; cv=none; b=ZDsF1PZiHp2ynsOhMjNpjh3crEvcJ7LReK0xRuVZC+ad296gx5TsYY2qb1rwyeT5aqcoH6ZxPLhc7rFnIJXz+LqEYBU2uVMTuZYN9zIVBmRwho3OG8eW82bgyZVPnaTslTq4CbH6n93gPr7S2g6kJ3BWkGCrpLDVluuprG9It0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730773226; c=relaxed/simple;
	bh=H7DITtRwtsNLWdS6hpi1Dq1VgEaFbuMZ06KvxC6YoWs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SZizjX8uGeAfhaUR5RSFwRMomXAxCS5EUgpzcma/MOacr+bz1tQqJi/4XnRxydmkAgcK5mG2IyVjWGIH+rJrJe2BVAV3vmQJ6xvygUNXRV4OgYpe67hh6Crz+HEXQwdWZvCOuGoI06JR5nEAwU0bf881SpD2yGYlFCMVtM3qvxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BpFh/7Eh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49996C4CECE;
	Tue,  5 Nov 2024 02:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730773226;
	bh=H7DITtRwtsNLWdS6hpi1Dq1VgEaFbuMZ06KvxC6YoWs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BpFh/7Ehgn9ARUYp1fdOf8SxLiBRY2aBW0N7E1q9IzeEZIOt7K4hEJdyp+pe6US8Z
	 uIyNHtDk4FANEE6YLIIWaqyy2WSAMBucrhSdie4jQJqi5CI6+gvS2RTiEw6/2F3m5H
	 MaUIe+x0XFTN/YfVkfHLg84xg6XCqVop8eUycfERc2fJrF05xDsfxslKnSMQoMkbYF
	 Uxa4eZ+hJuELXSKtHaX2Jf2azkq+aC0FP8IlyixSRgqtudHMwDHXit5qi0fTWlCMpL
	 jZo34LnPV8ZdXr1T7q8TSW1kBpNOw9XkK4noVxRP/qylQMnK1+j0r0+hO9nM1oe1LS
	 cGZU2YX9017Fg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F203809A80;
	Tue,  5 Nov 2024 02:20:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] ptp: Remove 'default y' for VMCLOCK PTP device
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173077323501.89867.2401311053737596737.git-patchwork-notify@kernel.org>
Date: Tue, 05 Nov 2024 02:20:35 +0000
References: <89955b74d225129d6e3d79b53aa8d81d1b50560f.camel@infradead.org>
In-Reply-To: <89955b74d225129d6e3d79b53aa8d81d1b50560f.camel@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kuba@kernel.org, richardcochran@gmail.com, peter.hilber@opensynergy.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 ridouxj@amazon.com, virtio-dev@lists.linux.dev, rluu@amazon.com,
 chashper@amazon.com, abuehaze@amazon.com, pabeni@redhat.com,
 christopher.s.hall@intel.com, jasowang@redhat.com, jstultz@google.com,
 mst@redhat.com, netdev@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de,
 xuanzhuo@linux.alibaba.com, maz@kernel.org, mark.rutland@arm.com,
 daniel.lezcano@linaro.org, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, qemu-devel@nongnu.org, horms@kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 02 Nov 2024 16:52:17 -0500 you wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The VMCLOCK device gives support for accurate timekeeping even across
> live migration, unlike the KVM PTP clock. To help ensure that users can
> always use ptp_vmclock where it's available in preference to ptp_kvm,
> set it to 'default PTP_1588_CLOCK_VMCLOCK' instead of 'default y'.
> 
> [...]

Here is the summary with links:
  - [net-next] ptp: Remove 'default y' for VMCLOCK PTP device
    https://git.kernel.org/netdev/net-next/c/18ec5491a495

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



