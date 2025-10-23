Return-Path: <linux-rtc+bounces-5128-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1438EBFF945
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 09:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5A7A934D28D
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 07:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167A72D9ED5;
	Thu, 23 Oct 2025 07:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="QNlHnrn/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4C32C11C2;
	Thu, 23 Oct 2025 07:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761204105; cv=none; b=DCIpKRV/WFDuKiX9SENKYNXTcolKMwEdQ3VYAnea8JRu+NDTadnWo3YhP79DR2MbxxCFkH4QvK/bo1ZmU2EQW/xxCZmERqW5kgS/afeCozym5cptSzqHFAgDx1/6xlal0IqvDTmmJSJKw13u6ouZQX9jKsVTIJyN7zMxrkIqxtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761204105; c=relaxed/simple;
	bh=+HsRzDs8IBxXYR8tu9jQXA2eKFmvx9n1ZSbIla6Dyw8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lA/0JU7OD3v8b412ONbx2J6EHIcex7kFiyPmUb6Y9Hh7xVnw06yA0IzDDB0AEjhYftdCslkDfNtXK01jLgH5mN0U3tFtZdhKC4Nx+lRTioiG0iHEMdb3rTuWe4pVvNkPY+/2cif9cfYj3mWaKVAbtJBoTcNLxXViFoetVhvL23Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=QNlHnrn/; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail2; t=1761204083; x=1761463283;
	bh=+HsRzDs8IBxXYR8tu9jQXA2eKFmvx9n1ZSbIla6Dyw8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QNlHnrn/SLZBP7JLA6ma/rKRJis+vcnjgT40cpFvWTuFTnERMEhV0yi4/U+E4Fq7Y
	 3oPqx6jnPe3qH8JsvY1QcMIpr+Jk2zRa4GKYQd14WUH/HzoB4PAZh4wnLEbM6bULY4
	 bvXnp6lWDtmnjlrLNnh75z/g2T4Ajvag/Aeyc94O6IcivVKN99Es4IBggH5Tti4Nnt
	 deaLdnCRmCIjexFeZN8OdoTXpX+qpyqY7TYiDxjmYO9zrOgavhY/FkCEzNucQxHikG
	 +MLRGkSEMIkBPKJybTzc1aDH4i5e4+tWyy8mVDS4ptpMutzqag8N2sRO6n7PYPPycu
	 GCuvelCvTSA+Q==
Date: Thu, 23 Oct 2025 07:21:21 +0000
To: Nick Bowler <nbowler@draconx.ca>
From: Esben Haabendal <esben@geanix.com>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, linux-rtc@vger.kernel.org, stable@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: PROBLEM: hwclock busted w/ M48T59 RTC (regression)
Message-ID: <DmLaDrfp-izPBqLjB9SAGPy3WVKOPNgg9FInsykhNO3WPEWgltKF5GoDknld3l5xoJxovduV8xn8ygSupvyIFOCCZl0Q0aTXwKT2XhPM1n8=@geanix.com>
In-Reply-To: <krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt>
References: <krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt>
Feedback-ID: 133791852:user:proton
X-Pm-Message-ID: 334da54a4dd577e91e3c6fc50e62b2d72fd6a417
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, 23 October 2025 at 06:45, Nick Bowler <nbowler@draconx.ca> wro=
te:

> After a stable kernel update, the hwclock command seems no longer
> functional on my SPARC system with an ST M48T59Y-70PC1 RTC:
>=20
> # hwclock
> [...long delay...]

I assume this is 10 seconds long.

> hwclock: select() to /dev/rtc0 to wait for clock tick timed out

And this is 100% reproducible, or does it sometimes work and sometimes fail=
?

> On prior kernels, there is no problem:
>=20
> # hwclock
> 2025-10-22 22:21:04.806992-04:00
>=20
> I reproduced the same failure on 6.18-rc2 and bisected to this commit:
>=20
> commit 795cda8338eab036013314dbc0b04aae728880ab
> Author: Esben Haabendal esben@geanix.com
>=20
> Date: Fri May 16 09:23:35 2025 +0200
>=20
> rtc: interface: Fix long-standing race when setting alarm
>=20
> This commit was backported to all current 6.x stable branches,
> as well as 5.15.x, so they all have the same regression.
>=20
> Reverting this commit on top of 6.18-rc2 corrects the problem.
>=20
> Let me know if you need any more info!

Are you using the util-linux hwclock command? Which version?

Do you have CONFIG_RTC_INTF_DEV_UIE_EMUL enabled?

Can you run `hwclock --verbose`, both with and without the reverted commit,
and send the output from that?

/Esben

