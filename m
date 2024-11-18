Return-Path: <linux-rtc+bounces-2572-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C359D0F4D
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2024 12:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7E58282EBD
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2024 11:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA973194C8D;
	Mon, 18 Nov 2024 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ha2h8s/o"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E19F196C6C;
	Mon, 18 Nov 2024 11:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731928328; cv=none; b=A6PyMIsHfvUbGEycJVyq+XDN9TxaMuFpmSQvUp0Jk9P0kvTBU1wypeM5wQ9cB6ORwLR1bN0NiP9QvDVp4/hN9MxkKELjiWYtc0/AXYLJ0bAGBwHCa3FHse26LMuJtJdjEtq/gz5Upy+T82ZsxbCyMOCCgxbE9KRo5VAqzU176GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731928328; c=relaxed/simple;
	bh=vacgzuktlMGf/yf96z/I6z4kYBEqCXRAr3zSqvowKng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=du2iThDR+6midXxGlw7ZoMThSYJASqg6tdpTSkfZVa8fF/XPaM3UsPSgqjyKnLtYMNkXP8MSBKCLHVPwr5JEtesK4PHVV5RxXHHPMI6iL6taAHpBlkMhe9cEARptidcjblPv6Ua4JURTZL+4RaHeD2OwYPupQqcLSSOHYY1JvoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ha2h8s/o; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDF236000A;
	Mon, 18 Nov 2024 11:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731928324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vdjvivh4RDxlbNpQasAn3PVuH15RkE0WRNx5rGWPb48=;
	b=Ha2h8s/oRX36OqqwU3H94Y+y6sQFBtn/gb+P2hyE/kAcAKLUY+f1h3iFlZ35FEHh83J5UA
	wfI/mE7hfr+qv7gqe7EibMo8t15mFy2THiWta8R9nFUNgtiQh6wHpt5vbZiP/mNfAKF3MJ
	2ZPYMWGdHnuR9P7qYt2XxuO1RZCZteUe9SNtDfze64AByb176lU2Cfs3KvCIInsuz1jMvR
	O/b/6L8rEWfWYTPWNWGZfVZdL7Ez60R8JIwMoJ/ZZQ8tLwXCE1jnhQ5yoqQQ6sBRVH7GaO
	8shibklfKYKK/oWStkcN115Kg+oMaeAntOLoSM4HBYZm9NANU07VZDfqazzYTQ==
Date: Mon, 18 Nov 2024 12:12:03 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michel Pollet <michel.pollet@bp.renesas.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: rzn1: fix BCD to rtc_time conversion errors
Message-ID: <173192830950.23080.16569204274052735724.b4-ty@bootlin.com>
References: <20241113113032.27409-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113113032.27409-1-wsa+renesas@sang-engineering.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 13 Nov 2024 12:30:32 +0100, Wolfram Sang wrote:
> tm_mon describes months from 0 to 11, but the register contains BCD from
> 1 to 12. tm_year contains years since 1900, but the BCD contains 20XX.
> Apply the offsets when converting these numbers.
> 
> 

Applied, thanks!

[1/1] rtc: rzn1: fix BCD to rtc_time conversion errors
      https://git.kernel.org/abelloni/c/55727188dfa3

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

