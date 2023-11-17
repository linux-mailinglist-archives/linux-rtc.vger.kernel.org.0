Return-Path: <linux-rtc+bounces-309-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 281F47EF706
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Nov 2023 18:36:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B707B1F22890
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Nov 2023 17:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD65364B5;
	Fri, 17 Nov 2023 17:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V6sxxrZ9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E89D7E;
	Fri, 17 Nov 2023 09:36:26 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E30E8240008;
	Fri, 17 Nov 2023 17:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700242585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I6bVBs9+UlVN0UI83TPgVQSNAbRu17WJB14lmY0HUcc=;
	b=V6sxxrZ9FJ89mYPVhAz6mQLGwa9riLme0SOt3HQ71JxYLpSUcaYu0gdKl3W9kohV4KuxFI
	Uk5MHuml1f4GY/XYG1fsiIgKHcpvzOEZIDSyvpaFVL+ht1bvWPjY+Z5zx2N2WrcgoDXogV
	XvVR4J5hKr0yGNzVBQ5fwO0XMjgzWnm0whSiA9uBFH7UC4nYhgRoU+khjueFpXMnfvUoCB
	Xtijs1UllHTgppj9FZ+Q7eF1HuynX9A3HZMIHG2ATRdd3B8jX0xrE4gcXnqYefRnPkoD0k
	iG26md8wuM3xJrXfbvWQIHXjjYCujcU5d1k+h75zrjWe0TPlvw8Hn7FBhkg34g==
Date: Fri, 17 Nov 2023 18:36:24 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, alvin.zhuge@gmail.com,
	renzhamin@gmail.com, kelvie@kelvie.ca, rrangel@google.com
Subject: Re: [PATCH] rtc: cmos: Use ACPI alarm for non-Intel x86 systems too
Message-ID: <170024256921.406260.15395632233007933060.b4-ty@bootlin.com>
References: <20231106162310.85711-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106162310.85711-1-mario.limonciello@amd.com>
X-GND-Sasl: alexandre.belloni@bootlin.com


On Mon, 06 Nov 2023 10:23:10 -0600, Mario Limonciello wrote:
> Intel systems > 2015 have been configured to use ACPI alarm instead
> of HPET to avoid s2idle issues.
> 
> Having HPET programmed for wakeup causes problems on AMD systems with
> s2idle as well.
> 
> One particular case is that the systemd "SuspendThenHibernate" feature
> doesn't work properly on the Framework 13" AMD model. Switching to
> using ACPI alarm fixes the issue.
> 
> [...]

Applied, thanks!

[1/1] rtc: cmos: Use ACPI alarm for non-Intel x86 systems too
      commit: 3d762e21d56370a43478b55e604b4a83dd85aafc

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

