Return-Path: <linux-rtc+bounces-67-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C26977BE7F8
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 19:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFBF91C20836
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 17:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5F538BCB;
	Mon,  9 Oct 2023 17:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="INX4ASZN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AE11B264;
	Mon,  9 Oct 2023 17:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A51C433C7;
	Mon,  9 Oct 2023 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696872615;
	bh=EACK2tmq5+41Js6GZfBr/J8+BuSNLbbDDNpHvCryNec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=INX4ASZNRg/lD8oCQEsXmK56PSVK/sEm9Mkl83Lf+wu6Pq6XbuVOt8fQHRF/LILAS
	 fvBuviO4505VLsdbEbjKHnZpR9i3YN6+G42buKLgOzK30gks9PtUCHIIpMAGmvnre5
	 RidVSyLf/g5j7I1uMYVsSeIjpRqPCTh62O5WpvbM=
Date: Mon, 9 Oct 2023 19:30:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: Jens Axboe <axboe@kernel.dk>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jiri Slaby <jirislaby@kernel.org>, Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	ceph-devel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-serial@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	linux-mm@kvack.org
Subject: Re: [PATCH 7/7] block, drivers: make lots of attribute_group globals
 const
Message-ID: <2023100944-sandpit-bronco-3db4@gregkh>
References: <20231009165741.746184-1-max.kellermann@ionos.com>
 <20231009165741.746184-7-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009165741.746184-7-max.kellermann@ionos.com>

On Mon, Oct 09, 2023 at 06:57:40PM +0200, Max Kellermann wrote:
> This moves those variables to the ".rodata" section which reduces the
> kernel size a bit and protects the variables by putting them on
> read-only pages at runtime.

The kernel size should still be the same overall, you are just moving
pointers from one section to another, right?

If not, what are the numbers, show them please.

But step back, are you SURE you can make these attribute group pointers
const?  They are modified by some subsystems by adding or removing items
from the lists, so why does the core need to change for that?

thanks,

greg k-h

