Return-Path: <linux-rtc+bounces-2575-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAB99D1209
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2024 14:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D520A2841B5
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2024 13:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A58A1AA1FD;
	Mon, 18 Nov 2024 13:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eTNRq3PV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9484E19E993;
	Mon, 18 Nov 2024 13:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731936755; cv=none; b=aeY2EGfTxorQD0P+1CsbcIpF9stJjj9RgF7dYTr7Hg1qFhiZo2NtzyesE7qRrpNCX1YoXdqOR/QXVX8a58u3n6YL8PUKi4GXdT+qcDDEXzRwSBf+UJxPVjG65J8/I1XGS/d3GeWkVN7PD31e9Ie+PtuTJTVpueEV6xDiudeOJPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731936755; c=relaxed/simple;
	bh=C42YKE7jZahESTSJ5tD6AEtOflxAnn+VErruvV9Zsqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eynPlTqrxqXTY4k/zKCBm7IDb8UyCe3ip11GpEnpI/MjeknooyG+nmd2pQ49F79wgQdQ5GjtpzlcsLAMWNPKULq2anbt5jEhsY8LEFL8LQRRfDxKT558yWs1mOO+nK3FND339Rp2sGWWl9BfbY3T9H8xIpBF/yExWZa6q4xJQdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eTNRq3PV; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43F7B40006;
	Mon, 18 Nov 2024 13:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731936750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cu1ZpBnBIa3rUTwNq4XU3fAcyXszxvoc+KpdBTQ6I4M=;
	b=eTNRq3PVhFrW3t3LNfqp6uEL4rq1pVsh5cP5qMDByhu4PgW9OGDZTddGjlOk3gqHg22OIW
	cF13AsJF2E9e7jC+fnPRWE9ujGgru+gEz4ePRCJUFj1KKtvMW2uptFjueTDzWFr5Ozf5/M
	hQlnF67gVu2EX4GRnf3yWIIAfZmz5oMgsv+K1u0uLdprTWhrI0D/F/si8bR6cyeJi2z2LS
	KwRcRdzd1QIQNBbVaYwLBqGu5gFuEbRqsootDeQQsK2npHDGGfRaSCFt7pan8yoBKewKP+
	jdESmdKmJMWVEI+B4WyWJNwtfzY13Nuri43ZzW+r+MyyPpkRHHdgX0u4J4lyCg==
Date: Mon, 18 Nov 2024 14:32:29 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Finn Thain <fthain@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, Michael Pavone <pavone@retrodev.com>,
	linux-m68k@lists.linux-m68k.org, linux-rtc@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 1/2] rtc: m48t59: Use platform_data struct
 for year offset value
Message-ID: <173193673970.37302.12055966881506116157.b4-ty@bootlin.com>
References: <cover.1731450735.git.fthain@linux-m68k.org>
 <665c3526184a8d0c4a6373297d8e7d9a12591d8b.1731450735.git.fthain@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <665c3526184a8d0c4a6373297d8e7d9a12591d8b.1731450735.git.fthain@linux-m68k.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 13 Nov 2024 09:32:15 +1100, Finn Thain wrote:
> Instead of hard-coded values and ifdefs, store the year offset in the
> platform_data struct.
> 
> 

Applied, thanks!

[1/2] rtc: m48t59: Use platform_data struct for year offset value
      https://git.kernel.org/abelloni/c/a06e4a93067c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

