Return-Path: <linux-rtc+bounces-2130-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C62D99687D
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 13:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BB671C22100
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 11:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A9A1925A9;
	Wed,  9 Oct 2024 11:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeESnne9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E86192590;
	Wed,  9 Oct 2024 11:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728472836; cv=none; b=o+R1SU4eeZ0wlYRqGsojOxpiY+3/qp7rRkahjuD0ymxbR+fhZ8urxdPGWanpatbIDSLMO8G4z4nP8DAZEuv1iGw2ujLMBgv0cAb7u/dn3AdSImpQ+jB3C0hrY8myjyAtYLAUhQ+khCE+2lSeTQ4OmzbTV+aWle+Z6hhi78mIVCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728472836; c=relaxed/simple;
	bh=PO8I+wMbjxk9wJfkhxRi+SCshRAINl3eIBujy6ev3Ls=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fMbm+WsHhTwMtMNVFWBBhmOcJbBxaZ1Pumu7KdXIbXI7OZ9RDyo75UkF9uW4c5As9qIdz1l72aLuUp3S4JhTcabA+LPmQfRd8e0qEsNOzal/hJmVhxfNRtRDZfcQ8oZvqy8TMGjLiKD/I4bSZEsE9HcDimQf2+RvTEMYIjCYfMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeESnne9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0266BC4CEC5;
	Wed,  9 Oct 2024 11:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728472836;
	bh=PO8I+wMbjxk9wJfkhxRi+SCshRAINl3eIBujy6ev3Ls=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PeESnne9gUBTqt1NgQA+awNIHrQWQTICrFJrCONIO3tOGkbY/2LmnOhHfDZSYfTgR
	 cph7avFYYMzp+p1RYXzh1ibKqxQOU1IJNokN8s/KhovSMS1GWpHXYlwMctZR9wchsL
	 T8TIEEMKdnkygw0j70wYKL6ojUHV8zd99fDLP3EFGE3CN/nLNzZxciE51NVgXCmCsv
	 3IDlMd41VXau/Kbj9+i+R53gKepIZpI88SszBWGmlTAY0HuLBAV8/tmjKqjjsA/ZTO
	 6QxFNXZnjTElDshCgCE5B1Jb0NwpHjFPPG+dD3DQplF3yfE/UQ9USOoB/yyckfofv1
	 yUJkB24Uq9/Rg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D3D3806644;
	Wed,  9 Oct 2024 11:20:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v7] ptp: Add support for the AMZNC10C 'vmclock'
 device
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172847284000.1228916.8770974683503977940.git-patchwork-notify@kernel.org>
Date: Wed, 09 Oct 2024 11:20:40 +0000
References: <78969a39b51ec00e85551b752767be65f6794b46.camel@infradead.org>
In-Reply-To: <78969a39b51ec00e85551b752767be65f6794b46.camel@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: richardcochran@gmail.com, peter.hilber@opensynergy.com,
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
by David S. Miller <davem@davemloft.net>:

On Sun, 06 Oct 2024 08:17:58 +0100 you wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The vmclock device addresses the problem of live migration with
> precision clocks. The tolerances of a hardware counter (e.g. TSC) are
> typically around ±50PPM. A guest will use NTP/PTP/PPS to discipline that
> counter against an external source of 'real' time, and track the precise
> frequency of the counter as it changes with environmental conditions.
> 
> [...]

Here is the summary with links:
  - [net-next,v7] ptp: Add support for the AMZNC10C 'vmclock' device
    https://git.kernel.org/netdev/net-next/c/205032724226

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



