Return-Path: <linux-rtc+bounces-1616-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB1193D570
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 16:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30B5C1F23490
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 14:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C49F1D545;
	Fri, 26 Jul 2024 14:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbQv/VTJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50B71DDD1;
	Fri, 26 Jul 2024 14:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722005856; cv=none; b=YXdhUwAqVaByw97GpZXMk/vr2BZNGMT8JyLvLGh0D4Xio9XgyKuQ3w4ATerfgv20FwiZe2qkOLrM+4XzkpOEDSL9pBBMnROb60P78RhGm0FXgVQFgIWpf614PCy68aS3tw0MhvATyfrdEwhCs5gwi6BM5NpuaOI3HBXLdaAFtc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722005856; c=relaxed/simple;
	bh=/4o8fEC+h2Ivu0V3GzkZo3pkL5aHvQjMhbi9PQkddjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=npq97nmO/PTv5yEC8dgOmncZF0xiCn//gBNC6xRxBL9dX6ZDfwBn5KBraHHdWGYJl07ctokdVbb6opc/cqqbMca1dVKRWwPDtlKdc9jfJL9iBXrusHJFFTDnbzTpRgSrkwHCDe4adWRi++57MSK7Vv/d16WJd6TisQf3nfvq9nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbQv/VTJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F00C32782;
	Fri, 26 Jul 2024 14:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722005856;
	bh=/4o8fEC+h2Ivu0V3GzkZo3pkL5aHvQjMhbi9PQkddjQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bbQv/VTJsSXXBfWn9d5jNmlUpQJhLulrIk6kPSLeu/HTYZd54QX5J1L7YSXoEtomX
	 FPUJCq6HKj70Mall6mhVmoKP03yxk2rFfrbMTgY8Wp7Le//atStwk2cfJ5uiDWqXqF
	 hNg8JqEavXLaRPHNweCzSWbG51aIU1FPgvL9PM6Sq+3GL5xaGxDD0wiwc+A2G3bITB
	 ltyTUMTUofGQtb/DwyvVAhj+1OpxMWN48bY3CNpBFw9K2s66dye0K8SHRmDztvr9Xh
	 7ToydHEq1rKp/363PkJya2vJLVtRx0FU8IlBDsdglb96Sk0Avycy0RPpb9C0/kGOS6
	 A0daiYqt03Xww==
Date: Fri, 26 Jul 2024 07:57:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Richard Cochran <richardcochran@gmail.com>, Peter Hilber
 <peter.hilber@opensynergy.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>, "Chashper,
 David" <chashper@amazon.com>, "Mohamed Abuelfotoh, Hazem"
 <abuehaze@amazon.com>, "Christopher S . Hall"
 <christopher.s.hall@intel.com>, Jason Wang <jasowang@redhat.com>, John
 Stultz <jstultz@google.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marc Zyngier
 <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, qemu-devel
 <qemu-devel@nongnu.org>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2] ptp: Add vDSO-style vmclock support
Message-ID: <20240726075734.1ee6a57c@kernel.org>
In-Reply-To: <7b3a2490d467560afd2fe08d4f28c4635919ec48.camel@infradead.org>
References: <7b3a2490d467560afd2fe08d4f28c4635919ec48.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Jul 2024 13:28:17 +0100 David Woodhouse wrote:
> +`       status = acpi_walk_resources(adev->handle, METHOD_NAME__CRS,

   ^ watch out for ticks!

