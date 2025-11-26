Return-Path: <linux-rtc+bounces-5462-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CD540C89169
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Nov 2025 10:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5F60D35835B
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Nov 2025 09:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7574A30BF74;
	Wed, 26 Nov 2025 09:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="LCChGlIo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A263090C6;
	Wed, 26 Nov 2025 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150403; cv=none; b=hxgaWZGKw3imXznNSBBhxKnE/tE4iVZCpyotGO2U/TmjcrenBs5CqmK9I3yEqHuqOLPkETTxyCnlv5FPurR4l7vIDhiDUyiCJAGBylryQ49qnFkFQWlvEjTcg/2IU3S0qgVTkgF2MCPNSESNW5eJlG473I5AxaO8vZcureQ5W9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150403; c=relaxed/simple;
	bh=AfDBkPaSHEH12W0txSPu3aX4L9071oFXlQtzgNtVWQE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NlcVi9bsfhdpzU1oRJwchpaL8u5lXHCEt2qOFa8sZQiAhbcIQzkm+9Uvl47QAlLP1nN5VntFNhHQtxLBKRUL6zXxzsu/KTM/dfrFIB7Zaos/La+lqBSsWtnxluZUswH1ZkDilryzK5feAw2jbw6pcLMFQt9XRq8F2yNggvFq1qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=LCChGlIo; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=kX18TokZJrRxzuxjDzOD7jkR62kfpAqVIr+hp9PYCqU=; t=1764150400;
	x=1764755200; b=LCChGlIokez1125S1qRl5f/gDC6NKvnh84wv7gm0onfv9mKftyBilrprjiDzJ
	Q7yC0L5cGUQu9aRCGBYFXJVhSZ4ICijWmrIkeYnoFbIDO7IgSrlZXvR8ejOxrfsPp7xyNy7+kasZ1
	LdZaswV1Hh71jU1cpzrwkVtknnkwi1ZnF8YFD+crtUnKngF2vX20erJ++osxKrnrIaACTrsdDHbPw
	9+IfIaMqNzjtF2L+nO7BGVgcpduXUUyobOWo4wLbBr4HUWxFzP5j/Urn80aO6SvcpaopBrMulpeaO
	ugb6/licB78BSIdzNxEe9UFOHd48MLGmmT0isJShHZkc/CooKQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vOC6g-00000003j2F-1Bur; Wed, 26 Nov 2025 10:46:38 +0100
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vOC6g-00000001zCX-0BlY; Wed, 26 Nov 2025 10:46:38 +0100
Message-ID: <f60b787529422eb2b3655b92aa8a7377b838baf4.camel@physik.fu-berlin.de>
Subject: Re: PROBLEM: hwclock busted w/ M48T59 RTC (regression)
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Nick Bowler <nbowler@draconx.ca>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, linux-rtc@vger.kernel.org
Cc: Esben Haabendal <esben@geanix.com>, stable@vger.kernel.org, 
	sparclinux@vger.kernel.org, regressions <regressions@lists.linux.dev>
Date: Wed, 26 Nov 2025 10:46:37 +0100
In-Reply-To: <gfwdg244bcmkv7l44fknfi4osd2b23unwaos7rnlirkdy2rrrt@yovd2vewdviv>
References: 
	<krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt>
	 <gfwdg244bcmkv7l44fknfi4osd2b23unwaos7rnlirkdy2rrrt@yovd2vewdviv>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Nick,

I have not used the regression tracker before, so let's give it a try:

#regzbot ^introduced: 795cda8338eab036013314dbc0b04aae728880ab

Adrian

On Tue, 2025-11-25 at 22:18 -0500, Nick Bowler wrote:
> Any thoughts?
>=20
> The problem is still present in 6.18-rc7 and reverting the commit
> indicated below still fixes it.
>=20
> I am also seeing the same failure on a totally different system with
> Dallas DS1286 RTC, which is also fixed by reverting this commit.
>=20
> Since the initial report this regression has been further backported
> to all the remaining longterm kernel series.
>=20
> Thanks,
>   Nick
>=20
> On Thu, Oct 23, 2025 at 12:45:13AM -0400, Nick Bowler wrote:
> > Hi,
> >=20
> > After a stable kernel update, the hwclock command seems no longer
> > functional on my SPARC system with an ST M48T59Y-70PC1 RTC:
> >=20
> >   # hwclock
> >   [...long delay...]
> >   hwclock: select() to /dev/rtc0 to wait for clock tick timed out
> >=20
> > On prior kernels, there is no problem:
> >=20
> >   # hwclock
> >   2025-10-22 22:21:04.806992-04:00
> >=20
> > I reproduced the same failure on 6.18-rc2 and bisected to this commit:
> >=20
> >   commit 795cda8338eab036013314dbc0b04aae728880ab
> >   Author: Esben Haabendal <esben@geanix.com>
> >   Date:   Fri May 16 09:23:35 2025 +0200
> >  =20
> >       rtc: interface: Fix long-standing race when setting alarm
> >=20
> > This commit was backported to all current 6.x stable branches,
> > as well as 5.15.x, so they all have the same regression.
> >=20
> > Reverting this commit on top of 6.18-rc2 corrects the problem.
> >=20
> > Let me know if you need any more info!
> >=20
> > Thanks,
> >   Nick

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

