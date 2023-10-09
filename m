Return-Path: <linux-rtc+bounces-64-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FDF7BE7BF
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 19:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 962341C20958
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 17:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4468F374FD;
	Mon,  9 Oct 2023 17:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gaeCO8ad"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F87A5E
	for <linux-rtc@vger.kernel.org>; Mon,  9 Oct 2023 17:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC3DC433C8;
	Mon,  9 Oct 2023 17:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696872244;
	bh=GKFEMN07hNN5E82vN+0pDhAfiO1nUR4XmqjuuROxYI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gaeCO8adurUwxASZD9wB3BP6/8Uz3GUJS7FD6aNiJ2KGWv+chps2D9Eg4pniyWtYO
	 MSY0ZivypkGcAdu/Rz5IstpFGurLL4yJ5tf0b7mgo3n02SSLmgB92sbLalLiSXaN8W
	 naBQjkpOGBlzZHk2SK5sFsNTdfytbVP5JtxLZZBM=
Date: Mon, 9 Oct 2023 19:24:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] drivers/rtc/sysfs: move code to
 count_attribute_groups()
Message-ID: <2023100943-anew-choking-5954@gregkh>
References: <20231009165741.746184-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009165741.746184-1-max.kellermann@ionos.com>

On Mon, Oct 09, 2023 at 06:57:34PM +0200, Max Kellermann wrote:
> This avoids overloading the "groups" variable for three different
> purposes

What 3 different purposes?

And you sent a patch series that hit a lot of different subsystems and
maintainers all at once, but you didn't cc: all of us.  Who is supposed
to take these?

But step back, _WHY_ are all of these changes needed?  I don't see a
cover letter explaining the rational, and on their own, they really
don't do anything, so it's really confusing as to what is going on here.

thanks,

greg k-h

