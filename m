Return-Path: <linux-rtc+bounces-3041-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F259A1B86C
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 16:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E1D318864CE
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 15:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B23F14D708;
	Fri, 24 Jan 2025 15:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="G2LQHAdd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828C113AD20;
	Fri, 24 Jan 2025 15:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731311; cv=none; b=tpBZtrdZCgrwFBLKUk4LapXn8PWeFWp7UWRqNkdDu7BdmvS8wotDSmBY87C5P82Wr73W2oiKFC/OqEI31NleorEtoSe5JHNHuf6TKObWR9h1yoMxHJ9LjPfG4sBPUE+KQ6CVjzQw5Pv3sq+sdPp9Suv4PQhglfQNwNu6TiwwIR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731311; c=relaxed/simple;
	bh=KBG7NvkrmDHzWIwYHLwwtjFTPnw67LMnsgYP2Mj5OaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUG3rsdYpEK/fMJdNF5TdPFnHm/qzQtZdyRrpDZ07DS+g9GuUVZ8dmoiUuk7neUssaEtj8+uG+ZUGctxK96L2M181QWK7aMr0T4UE1HaRYSLo/3Mhrv3xP/R9hLBPhvXUG/Hr5n0jGZMiqa8II8AlcLN6uCbV3t19c4x/vxv/FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=G2LQHAdd; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nVBOwRrha/HOYVrDV5FfdeEFWbkGNsH7Lsvt6kqlsmE=; b=G2LQHAddDFAQLaaIfrLsB6OWE4
	c4oRQBGXhLDVDyfvumPioriRkpc5HvcTzO8kxUe24T/CTy1aNUncus9esnL6Bj4tLJB+yIN/nTM3v
	tQbJO9nsh7lpv0FyN/t5WPByyBQrkqZhxVg7hdeULGpCIrhqfEC9+jFrKTz1FqOWlTXw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tbLIE-007ckI-DP; Fri, 24 Jan 2025 16:08:22 +0100
Date: Fri, 24 Jan 2025 16:08:22 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Huisong Li <lihuisong@huawei.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, netdev@vger.kernel.org,
	linux-rtc@vger.kernel.org, oss-drivers@corigine.com,
	matt@ranostay.sg, mchehab@kernel.org, irusskikh@marvell.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, louis.peens@corigine.com,
	hkallweit1@gmail.com, linux@armlinux.org.uk, kabel@kernel.org,
	alexandre.belloni@bootlin.com, krzk@kernel.org,
	zhanjie9@hisilicon.com, zhenglifeng1@huawei.com,
	liuyonglong@huawei.com
Subject: Re: [PATCH v1 0/9] Use HWMON_CHANNEL_INFO macro to simplify code
Message-ID: <fca9ca93-16e4-44db-8fbb-90bc6af952e7@lunn.ch>
References: <20250124022635.16647-1-lihuisong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124022635.16647-1-lihuisong@huawei.com>

On Fri, Jan 24, 2025 at 10:26:26AM +0800, Huisong Li wrote:
> The HWMON_CHANNEL_INFO macro is provided by hwmon.h and used widely by many
> other drivers. This series use HWMON_CHANNEL_INFO macro to simplify code.
> 
> Huisong Li (9):
>   media: video-i2c: Use HWMON_CHANNEL_INFO macro to simplify code
>   net: aquantia: Use HWMON_CHANNEL_INFO macro to simplify code
>   net: nfp: Use HWMON_CHANNEL_INFO macro to simplify code
>   net: phy: marvell: Use HWMON_CHANNEL_INFO macro to simplify code
>   net: phy: marvell10g: Use HWMON_CHANNEL_INFO macro to simplify code
>   rtc: ab-eoz9: Use HWMON_CHANNEL_INFO macro to simplify code
>   rtc: ds3232: Use HWMON_CHANNEL_INFO macro to simplify code
>   w1: w1_therm: w1: Use HWMON_CHANNEL_INFO macro to simplify code
>   net: phy: aquantia: Use HWMON_CHANNEL_INFO macro to simplify code

Please split these patches per subsystem. Maintainers generally have
scripts to accept patches, and those scripts don't work when there are
patches for other Maintainers mixed in. So you need 4 patchsets,
media, net, rtc and w1.

I would also like to see the HWMON Maintainers opinion on these. A
patchset containing these have already been NACKed once. These patches
do however look like valid cleanups. But are they just so you can do
something bad in your vendor tree, which will never make it to
mainline?

	Andrew

