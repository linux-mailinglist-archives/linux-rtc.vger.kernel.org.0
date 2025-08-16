Return-Path: <linux-rtc+bounces-4705-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A8EB28DFC
	for <lists+linux-rtc@lfdr.de>; Sat, 16 Aug 2025 15:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22D1C7A02F9
	for <lists+linux-rtc@lfdr.de>; Sat, 16 Aug 2025 13:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2EA291C1C;
	Sat, 16 Aug 2025 13:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+FTiovs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3C82566E9;
	Sat, 16 Aug 2025 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755349636; cv=none; b=Xqt6Ust3bDdwKneCI1+U7Oocljmxj97aVc52CxwRTMHmb3ST7dRYkp55zDbynILJL8Q+iQRASBOvWbOeYp06XTITSq/WoMUtu8bZWDSkrUiqwjJH4G4YmWHke8BDviiB6ZEsnXqTacuqdI0pbRQP0a+F4l6Dp0mvJkQXHqNRteM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755349636; c=relaxed/simple;
	bh=brxe50efcVWu0DS7Eg794HpTqoH8ZZU44OfwBxGPpO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctXMm2GqNFTYbWEYzOdSnkqwZFBYJ5+aERhImy1sbZNmTt+hYmowW8ppADWpCpDUHCEv0XHNeIs713E16S9sq9xy4EcFFBox3Yt7a8HZwoDe1U2YDR9ma6AsGL+96XoZyBf/yqtRgV4LIlfMM/1yUFqGrxwWncx7zOVLPt2ifIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+FTiovs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010EAC4CEEF;
	Sat, 16 Aug 2025 13:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755349635;
	bh=brxe50efcVWu0DS7Eg794HpTqoH8ZZU44OfwBxGPpO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o+FTiovsZ7mPoWIaHwbhJcpae+pvXVDjaihqmHEudYG+bqf/HCjbFYN49LVn6aoak
	 6/DHitual8jDJCh0ryizzcX7ZWYM2SRy88huxn+OWdn/NjfT/F7GDfOAbHZaY7o1hC
	 99mHi8NbV77+9ByOjy/WtqRcACldTfnh5AISfV7vvulOQxF8dry+mzzj5nMAMsHn1n
	 EaBu8YP4djz3mcwDVyB8TixswwKydVR8zQBJYwbeV6aes4J9U9F7iw03VnLbzmpMko
	 un4hKTwzXWjhqkuZbIb5UVKA4hTSTZNBpgU8Aed3GpWqpaVF/wbN4Z3R2QYOj7WnXg
	 3iQh8zgzF/AdA==
Date: Sat, 16 Aug 2025 09:07:13 -0400
From: Sasha Levin <sashal@kernel.org>
To: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Tyler Hicks <code@tyhicks.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.16-5.10] rtc: ds1307: handle oscillator stop
 flag (OSF) for ds1341
Message-ID: <aKCCgY814UDHGpDV@lappy>
References: <20250808153054.1250675-1-sashal@kernel.org>
 <20250808153054.1250675-5-sashal@kernel.org>
 <51eda58a-0c5e-4e0f-ae1f-87147fd8453c@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <51eda58a-0c5e-4e0f-ae1f-87147fd8453c@linux.microsoft.com>

On Mon, Aug 11, 2025 at 09:46:07AM -0700, Meagan Lloyd wrote:
>On 8/8/2025 8:30 AM, Sasha Levin wrote:
>> From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
>>
>> [ Upstream commit 523923cfd5d622b8f4ba893fdaf29fa6adeb8c3e ]
>
>Hi Sasha,
>
>Without the first patch of the series, the OSF bit will get cleared in probe, so for it to meaningfully handle an invalid RTC, we'll need to take the first patch too.
>
>The upstream commit is 48458654659c9c2e149c211d86637f1592470da5
>
>https://lore.kernel.org/r/1749665656-30108-2-git-send-email-meaganlloyd@linux.microsoft.com
>
>It removes the clear of the OSF status flag in probe in the shared ds_1337, ds_1339, ds_1341, ds_3231 switch case block.

I'll take it too, thanks!

-- 
Thanks,
Sasha

