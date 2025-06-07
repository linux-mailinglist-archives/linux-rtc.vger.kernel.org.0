Return-Path: <linux-rtc+bounces-4238-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FA9AD0B8B
	for <lists+linux-rtc@lfdr.de>; Sat,  7 Jun 2025 09:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CC937A2785
	for <lists+linux-rtc@lfdr.de>; Sat,  7 Jun 2025 07:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEDA1F3D20;
	Sat,  7 Jun 2025 07:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Zf2MXMXt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767C21CF7AF;
	Sat,  7 Jun 2025 07:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749280149; cv=none; b=VFrRN9oLqEPWdJUwp0Uc9MmzLizPdIGGZHHBbwoWyjR3cshELEk3fsnnufsx2mX/qyUxSWxdOYDZvNOTmbGReYfFMVG05Q8eaeeZrlMOyU6qB34slmcP9b2Wlkf/sn9hdlfH9OqvSmwVQM0Q6P9sKyq8RltgBZBPFM4aqeikXxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749280149; c=relaxed/simple;
	bh=RDt+DMqbhAr9FPUjOuUBCp4oYXq7/SHLaiHMRYeDJqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFDUc2kv1dGM+iWmczhQdDJTygkkIPzetaZx/o9BUDSArz3l0oHlc91tzhUTnjFIDclBfLtYr2BIVLE6zxb9Fvw4UF8L4k2oHgDUYoxi/bTUp+1+r0G5DYlVxVFAWObaXfq+GdjztPfYgNXeoru2/kqUeIy3df/P+Zln8FXqPis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Zf2MXMXt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1ABC4CEE4;
	Sat,  7 Jun 2025 07:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749280149;
	bh=RDt+DMqbhAr9FPUjOuUBCp4oYXq7/SHLaiHMRYeDJqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zf2MXMXtPtDILqPbCkEkBZrX2Xg2bHwp7k5OvW5WHb7nufMqK+0WnnzO1+NZ+B5DN
	 VvgKMXvOAhxOWdAVLqXrSHvsdwiDY4qS+8QdieSObS7omUNwpvU25e0XTt4guaEwhB
	 /iSsWrkt3pp+NM1HMy10fKPmZ9dI40kok7LdiTCo=
Date: Sat, 7 Jun 2025 09:09:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-rtc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 6.15.y 0/2] rtc: backport support for handling dates
 before 1970
Message-ID: <2025060743-cozy-dormitory-5e4d@gregkh>
References: <cover.1749223334.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1749223334.git.u.kleine-koenig@baylibre.com>

On Fri, Jun 06, 2025 at 05:44:37PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> as described in the commit log of the two commits the rtc-mt6397 driver
> relies on these fixes as soon as it should store dates later than
> 2027-12-31. On one of the patches has a Fixes line, so this submission
> is done to ensure that both patches are backported.
> 
> The patches sent in reply to this mail are (trivial) backports to
> v6.15.1, they should get backported to the older stable kernels, too, to
> (somewhat) ensure that in 2028 no surprises happen. `git am` is able to
> apply the patches as is to 6.14.y, 6.12.y, 6.6.y, 6.1.y and 5.15.y.
> 
> 5.10 and 5.4 need an adaption, I didn't look into that yet but can
> follow up with backports for these.
> 
> The two fixes were accompanied by 3 test updates:
> 
> 	46351921cbe1 ("rtc: test: Emit the seconds-since-1970 value instead of days-since-1970")
> 	da62b49830f8 ("rtc: test: Also test time and wday outcome of rtc_time64_to_tm()")
> 	ccb2dba3c19f ("rtc: test: Test date conversion for dates starting in 1900")
> 
> that cover one of the patches. Would you consider it sensible to
> backport these, too?

If you want to, sure, but normally people run the latest in-kernel
selftests for older kernel trees.

thanks,

greg k-h

