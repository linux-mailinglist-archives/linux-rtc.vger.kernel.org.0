Return-Path: <linux-rtc+bounces-4913-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD61B596FB
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Sep 2025 15:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C2377A5FA5
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Sep 2025 13:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF06C307AD7;
	Tue, 16 Sep 2025 13:06:00 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FE2248F7D;
	Tue, 16 Sep 2025 13:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758027960; cv=none; b=pSeFOa5Ts601meHeAI4JltVTPDhKF/k4+QW6N4eNZrF6kOKWjqqRaD7aMkytwWMngmE3hsT5wtY0I5Pi9Mf8vqQJIMkYnC9u+U38O0gbkQl7Z7dYkiUGICklMRdOOyraOJldDSykWUagb6RUOf6hgDyXqG9sXRzo8dttr89xAmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758027960; c=relaxed/simple;
	bh=7PFeQhGub4pc5GdZaWttUgFBwNnytLn3zDlqurXe9Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1zDHrH0/MuMzhJnVnvsAPQs4RJQXrRYGJ6J/djLquOya0ZG7C9r61VBvZc1I9duTwBVK7jAiQhwfJmf4EHAyC13bywOElUjN+407X6rMATi25eVs/mk8lp53DLKEoQNZC52LM6fCbcZ0JtugrXJTNyAWCTx/1FtUHrkcdgej3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6061A340E10;
	Tue, 16 Sep 2025 13:05:58 +0000 (UTC)
Date: Tue, 16 Sep 2025 21:05:53 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Lee Jones <lee@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Alex Elder <elder@riscstar.com>,
	lgirdwood@gmail.com, alexandre.belloni@bootlin.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Message-ID: <20250916130553-GYC1255161@gentoo.org>
References: <20250825172057.163883-1-elder@riscstar.com>
 <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
 <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
 <7aba368e-709b-49b0-b62c-f2f8250c8628@sirena.org.uk>
 <20250916084229.GG1637058@google.com>
 <c8bcfff9-9d2a-426d-9df8-100efd2af64f@sirena.org.uk>
 <20250916122724.GB3585920@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916122724.GB3585920@google.com>

Hi Mark, Jones,

On 13:27 Tue 16 Sep     , Lee Jones wrote:
> On Tue, 16 Sep 2025, Mark Brown wrote:
> 
> > On Tue, Sep 16, 2025 at 09:42:29AM +0100, Lee Jones wrote:
> > > On Thu, 11 Sep 2025, Mark Brown wrote:
> > > > On Thu, Sep 11, 2025 at 11:36:41AM -0500, Alex Elder wrote:
> > 
> > > > > How should these two patches be merged?  Mark has reviewed the
> > > > > regulator patch 3 and Alexandre has acked the RTC patch 4.
> > 
> > > > We'd both have been expecting them to go via MFD.
> > 
> > > Why?  I don't see any dependencies between them (usually a shared MFD
> > > header-file).  If there are no deps, it should be taken through its own
> > > repo, no?
> > 
> > I used to just apply things but at some point Linus complained about
> > cases where the MFD ended up not getting merged (missing the merge
> > window or whatever) so I've been treating them like they had an actual
> > dependency.
> 
> Not sure I've seen any of that from Linus, but I don't doubt you.  The
> MFD part has been merged now, so it's save to go ahead and apply the
> Regulator part.
> 

Forgive me to chim in..

To be honest, I don't really mind which tree the patch to go through.. 

But since the patch 3 has no build time dependency on previous two,
so it should be fair to take via pmu/regulator tree, I've done a check
locally which imply this..

What do you think, Mark?

-- 
Yixun Lan (dlan)

