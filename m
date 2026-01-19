Return-Path: <linux-rtc+bounces-5792-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DC7D3BB84
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 00:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B1083025172
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 23:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8161B142D;
	Mon, 19 Jan 2026 23:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="om+JDngi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFD86FC3
	for <linux-rtc@vger.kernel.org>; Mon, 19 Jan 2026 23:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768864137; cv=none; b=K/d0KlJvCyoqbT5hqgK44cq0mvbAj5VoAdVglRO8oh9p5368ypWmS2kbCvRylKhS+nzGUJhAILc4UldO80JjBEFQsJO98nqmVKVlDfwTJPdGkh1f5Ek4PHgQvb2YXoV4iTOtObenJoB+ekhkjTXcZtac54chlaqdA6yj6GPX1Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768864137; c=relaxed/simple;
	bh=+B0fHciQN4Z7EOJP081mm1yg5gqeqO/M7gg6Wbjb858=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZLo6H9XkFOekUVxtylVWuQ22yrVMqrDG19dFNsFh0QslOF+QUvdsRmkzUNHOvubLo89SJ6gyIc9TEZlqLf5bfXp4Nfqh6yY3+yxbzdm7pu803RSxDj4jws+hYeuJCHZiTVwWZa4PdLdy1PiZ+HyBtcyor9M4qvIZpHzYFm+C+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=om+JDngi; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 04F981A29A7
	for <linux-rtc@vger.kernel.org>; Mon, 19 Jan 2026 23:08:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF8EB60731;
	Mon, 19 Jan 2026 23:08:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C16FC10B68D00;
	Tue, 20 Jan 2026 00:08:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768864134;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=vPnNA4Xb6dAvTOp8cCMEfI/xsIEGGjk5hqKE3kaEBYI=;
	b=om+JDngi6ALH26fpaS38TeamyCBtD4/gK6n0c8b5iGgqXtY5z+h6nVc/7b3UP1cXwNQcfD
	c40xhrQHKns9Q7Pa6T0LlHnKtJtp2anQgn2gCl3WeOBRDbv0lT6z0cpRJrOLtyX6+Py4KJ
	LlzaF4KPzCg+fGjD33Snjsl7PV0rH/4aX6amPwL5FGFkrLGh2A0nyF81lJgTMaojN3uZoJ
	v+krw9qqhEBUSlyFDJx97Ba5wlzI4mbBIl/X6u/nDjjkZCjTqDxHNpIVDdpcUgFAQ0dIFN
	DX5QznFLqhtmb4ytdWn89UH+aheo/v0jdK8OlMMkD7hfktiU9mHCiAV/nDspCA==
Date: Tue, 20 Jan 2026 00:08:53 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org,
	"Anthony Pighin (Nokia)" <anthony.pighin@nokia.com>
Subject: Re: [PATCH] rtc: interface: Alarm race handling should not discard
 preceding error
Message-ID: <176886395102.2626260.9825526325627197287.b4-ty@bootlin.com>
References: <BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 25 Nov 2025 17:35:19 +0000, Anthony Pighin (Nokia) wrote:
> Commit 795cda8338ea ("rtc: interface: Fix long-standing race when setting
> alarm") should not discard any errors from the preceding validations.
> 
> Prior to that commit, if the alarm feature was disabled, or the
> set_alarm failed, a meaningful error code would be returned to the
> caller for further action.
> 
> [...]

Applied, after fixing the patch that has been mangled by outlook...

Also, you had this checkpatch error:
CHECK: From:/Signed-off-by: email comments mismatch: 'From: Anthony Pighin (Nokia) <anthony.pighin@nokia.com>' != 'Signed-off-by: Anthony Pighin <anthony.pighin@nokia.com>'


[1/1] rtc: interface: Alarm race handling should not discard preceding error
      https://git.kernel.org/abelloni/c/c6cf26c15ce7

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

