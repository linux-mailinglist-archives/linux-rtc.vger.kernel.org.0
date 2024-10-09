Return-Path: <linux-rtc+bounces-2134-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE3599757D
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 21:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C1D6284EEB
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 19:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5ED315CD49;
	Wed,  9 Oct 2024 19:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="FtdrYhHO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B9840849;
	Wed,  9 Oct 2024 19:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728501345; cv=none; b=ZBuygD50EfqPY6gaRiJ9SbCD0Vb8HbMlixuPPfrKPSlQceFy0hZ1yts7ufVgY5I5VgfmtNbWsbvyWc+RLc+WcyPJzcvNpE4Xkp1dfixpCoS4cEb/+qNTEHctuI3Qq4RVj++iFO8Eb85Gsj+eAODNmowW6pgjHrYuqx1dMMuzrsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728501345; c=relaxed/simple;
	bh=eeF51X/Pr889RF+v8derUcgl6dLAU/jZRB0uKu6r/jc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Cc:Subject:To:
	 References:In-Reply-To; b=FsHMlciNCvOPglZpw1NOvgt0iUwIdnRYliJgmlMPGhVjbISmnYiM7di+YpmLpd2Alxi8DvCjSJe/PsTpIblRPcdpPRz+jEF3+QngfOEbcwzyviqP5fzkgG6EI4AsF5FWs/36kIrWeX4VgYw7vSMCaS6somFv0AZNDHtbWjBe7Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=FtdrYhHO; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1728500611; x=1729800611;
	bh=eeF51X/Pr889RF+v8derUcgl6dLAU/jZRB0uKu6r/jc=; h=From;
	b=FtdrYhHOCw/N6RBvhv907tDGuV++7ajwgitObUQqTXSRW8kGRTzytCtgX+2ufhJMM
	 bIp1ggVfbw6HzrHkLrvgmOlxj3ia8gltnAE6rdLZwKlO8f9Dsbo3BGm0ywqp5uE5o5
	 ro615uJ38MN+LnsFH+88bcZk+d+PhMjlH6/uhqg17tHOtpopHU5Ses1e79rLgMrJCG
	 fINjhfN4E7Rn+ljz0zWBmh2B3HKhPfGVQoXcD55Mye80UFdgPAKQm/z0MhXK9Qrf+T
	 PxFXIRM3csFBmxcsz68mW1mvwe3p+l7C6d/IjatmfhbQysOuL7LN985/jwc5MKq1gL
	 0clM4YKy5hImQ==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 499J3TIW034138
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 9 Oct 2024 21:03:30 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Oct 2024 21:03:29 +0200
Message-Id: <D4RIBTPD0W5Y.198XNBY2OIDGL@matfyz.cz>
From: "Karel Balej" <balejk@matfyz.cz>
Cc: <duje.mihanovic@skole.hr>, <phone-devel@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
Subject: Re: (subset) [RFC PATCH 1/2] mfd: 88pm886: add the RTC cell and
 relevant definitions
To: "Lee Jones" <lee@kernel.org>
References: <20240920161518.32346-1-balejk@matfyz.cz>
 <172846840369.471299.4136306941601177946.b4-ty@kernel.org>
In-Reply-To: <172846840369.471299.4136306941601177946.b4-ty@kernel.org>

Lee Jones, 2024-10-09T11:06:43+01:00:
> On Fri, 20 Sep 2024 18:12:34 +0200, Karel Balej wrote:
> > RTC lives on the base register page of the chip. Add definitions of the
> > registers needed for a basic set/read time functionality.
> >=20
> >=20
>
> Applied, thanks!

Thank you, however I'm a little perplexed.

It was my understanding that RFC patches should not be applied without
further agreement, is that not the case? Obviously this patch was very
simple and I used RFC mainly because of the RTC driver itself, but I'm
curious to know for future submissions.

Also, I expected the entire series to go at once through the rtc tree
with your ack as while it is not a strict dependency in terms of
breakage, the first patch seems rather pointless without the follow-up
which could theoretically take a long time to get applied and even some
requested changes could require changes to this patch. Could you please
explain what the policy is on this?

Thank you, kind regards,
K. B.

