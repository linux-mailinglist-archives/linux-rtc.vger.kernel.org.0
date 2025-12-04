Return-Path: <linux-rtc+bounces-5503-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F82CA21D2
	for <lists+linux-rtc@lfdr.de>; Thu, 04 Dec 2025 02:38:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C98C4300EDC4
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Dec 2025 01:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204EB136672;
	Thu,  4 Dec 2025 01:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GrMDnOOL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31878398F85
	for <linux-rtc@vger.kernel.org>; Thu,  4 Dec 2025 01:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764812336; cv=none; b=HOI5sMXH5iTsXN2YBJynWP1fQ2lco37ikUs8HskjZm6XbW7e711ULU4RvHCxtREAS3kGNjZpDwb3++yjFQnglv2MvbmHp/E3k1HTOn5hWekIia5Mka1pkTR1fRkgTPs7jY+kLQ0UiRWh/oCSN8irAU3+7CQT/x3e2D1JpE2DRzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764812336; c=relaxed/simple;
	bh=3E+wDMhRqo2KVJXuBApdP3R/emM6xLFrc9V0Xe6i4GE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=WoWoPhqC5eAtWO2en5RXEFWb7I9B8mPQnu/eron69Rm2kyIyt263p38oPV6RHR/qqu/E4f8HVXwZjslNtfBTw9w9XdvAk+1benm/rFG1gJUVrARc4zVQMjQx8MkvizKFsDJ/8vV09+umCFCNY7c0Ru0gFoC2rAxj4Eyd3XhyrjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GrMDnOOL; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=XY+cQBbYm6ZQJV8FI32/yuzm6KzFZAVYJTCdXIu05m8=; b=GrMDnOOLTnVpyMXDQZAKQVJuR+
	DLTr5L7+mf12Hc2eYpY2BHAIPuTkub5e1Y47Rv/voYaku0lJXt8os+oNS9eu1CN7fdH5lQpGmZPfD
	FgBgk7KddGPTveXWFMwW+wyZEt+hX4SIWhvzXyGsVDyahX0T9LG7imVWdK5h8Ngc7U81kl5qMCYpp
	Wwz6xf4WMrr8eYPu2lQgKLJFFB7PRfRdTFXRqreDo27zqbJK2HRZQNV83I1tK8AwVahKmqXCHxDLz
	q0v0SpmwrUKq5HTbRVaeQH9HjBOvkD4RYpj9DouYtwIZJF+Jvql4H5zvpgDb9Y2vsjKeB77438vu+
	wd/j1Eyg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQyJ0-00000007LF5-47El;
	Thu, 04 Dec 2025 01:38:51 +0000
Message-ID: <d9782d13-42b0-4dac-84c5-e7d7ce4f93cb@infradead.org>
Date: Wed, 3 Dec 2025 17:38:49 -0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org, Antoniu Miclaus <antoniu.miclaus@analog.com>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: rtc-max31335.c: use of IS_REACHABLE()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Just checking: should these be IS_REACHABLE(CONFIG_HWMON) ?
If not, what "HWMON" is being referenced here?

596:#if IS_REACHABLE(HWMON)
677:#if IS_REACHABLE(HWMON)
732:#if IS_REACHABLE(HWMON)

thanks.
-- 
~Randy


