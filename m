Return-Path: <linux-rtc+bounces-2521-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 122E89C48D7
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 23:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA19E284148
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 22:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24813150990;
	Mon, 11 Nov 2024 22:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LczZx+y+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73257F477;
	Mon, 11 Nov 2024 22:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731363087; cv=none; b=a39toFA1/gffzOkgyNH39zubsUzkCHiOf2BxNMG6OLdK8xSE4y0ZBvoX/nJo6IK7UHItwm6J2/QH4BtH2f0/QDXRXgzfw+r7YVgIRbptLBHUg7AeNpVcUUVMHBGbegBoA4AF99xl6oeoFqr+HTqJJ7xxbSh/+iY+a83QTbnmC0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731363087; c=relaxed/simple;
	bh=Idk6jfGnyUkyNSgOOeGpKnSK3LnAX07Jr8vuMk26ncc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyIKAhl0CEdHQ01Jn2YIUywGOI6irkx9UmQfB+1euowC6acwrrjysWCqUknoxpwmz1SnBRkzsmhzKKm7NyrBW7gV7X7LA0Vb/x+0Hwh7TcuC6KxwNMp9R7u+jSdwflYFG0Ukr9kdI8KDwrOOEvxNGJiQtOjie9IZZI8KSPsG4UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LczZx+y+; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D58DC1C0003;
	Mon, 11 Nov 2024 22:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731363083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XqAjmFDg8X+gBvDyP6q3GBrVaQ7mISwsorin3L1BA3Q=;
	b=LczZx+y+iB7hWel1LpJF1/3yOBzq504rmI0eJS6K310CkPPR1zTho/M3s37yZVP+QhIOAZ
	ezMrtUKyRxIk32wOTR6iwb86DumnBMkc6a2Vc+QrQaxVmcRMy8fHxG+Y3DZVHmXlFMI6fN
	rrqpTeQtlpI9zwrQjh2FltrCB7I7ta2mxJI9Juiy1toE3OtLY5PUE9RUddsi6hwo5RNi3O
	EF6zD9r/13lOvsePffyETdyPuIGME7ygST2udjQol89fdfOLR2sDvMW4gWcLIjzfmuZH1Q
	bNjbBx2J7z5J0V5qUiEbWX2EyvkfX2F7pHaYaspowsXRqP1gnjxjNsgy9+hjLA==
Date: Mon, 11 Nov 2024 23:11:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: john.stultz@linaro.org, Yongliang Gao <leonylgao@gmail.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yongliang Gao <leonylgao@tencent.com>,
	Jingqun Li <jingqunli@tencent.com>
Subject: Re: [PATCH] rtc: check if __rtc_read_time was successful in
 rtc_timer_do_work()
Message-ID: <173136306889.3322178.5149197946199507685.b4-ty@bootlin.com>
References: <20241011043153.3788112-1-leonylgao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011043153.3788112-1-leonylgao@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 11 Oct 2024 12:31:53 +0800, Yongliang Gao wrote:
> If the __rtc_read_time call fails,, the struct rtc_time tm; may contain
> uninitialized data, or an illegal date/time read from the RTC hardware.
> 
> When calling rtc_tm_to_ktime later, the result may be a very large value
> (possibly KTIME_MAX). If there are periodic timers in rtc->timerqueue,
> they will continually expire, may causing kernel softlockup.
> 
> [...]

Applied, thanks!

[1/1] rtc: check if __rtc_read_time was successful in rtc_timer_do_work()
      https://git.kernel.org/abelloni/c/e8ba8a2bc4f6

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

