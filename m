Return-Path: <linux-rtc+bounces-4912-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55314B59631
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Sep 2025 14:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BCEA4E6836
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Sep 2025 12:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE33430C365;
	Tue, 16 Sep 2025 12:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1jzHQiJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7116D296BA9;
	Tue, 16 Sep 2025 12:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758025651; cv=none; b=HD5GEFTnVULoIHw1SJXeDtLIFYaqXHmmiC2qy9q87aOrdKWi8ddilMcLCNIeT2hth7xEKPAt63aJ5HQNBtttfY3Z3m5ny7F+ssNi4f1SNpruWkeDc6BcoGFtReJRVgv89NgAWCvxb5+r5yOt1J5B8sK/MtZMPFK+84zxAyW+THI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758025651; c=relaxed/simple;
	bh=PNIloqRamoe/Ge+tqcsD4qceDuD9HPaHcfIdp82zej4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WCYCnSfgx1Z603HVyWIBIYrjxOAnwKnJfSI/tq3Ngq2rSiL8aWvuNeKBEANRRBbU8yYGVHF5tFFnjVbLxRRG89NEv1pEueurfaTSS9Ms5kzgxq2e83wLJ7Svq5eiYVx9kxsqVd4xsmBS8XsXw3sdXcqdppXOfyOnPti97YU+w50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1jzHQiJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107E0C4CEEB;
	Tue, 16 Sep 2025 12:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758025651;
	bh=PNIloqRamoe/Ge+tqcsD4qceDuD9HPaHcfIdp82zej4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D1jzHQiJiKYPH1CgVKK4Ty4Hg5VhVK3z3t8zMDGq+GocyFcKU8bBAH4mz6zJmkSR/
	 GLv+WQIGKQ3jW8dhfqFqd+vDQ2KBAMYz8Vs6ZgyqBdPvuhLtKrxqO8hGlYTL/QFmJa
	 umaOAcoPFzYfyEtZxsvOugzqJm6O5OV3sHftIJv5AgTL/fm6mg1I0dIgKRsJkzblc0
	 PtUOqM+6PVr21bfBYZSmujcMX4qsoABOWuZwiQUyVEyAM9WbmxaiqhBBf36Y1u+9j4
	 sejSITCPRgzLOORWc+5hzCuQgWQ9AHnc9Mro0NmLJAgzoHnYUZbOONCyEgpp9cat9j
	 zZowNpBu2FqGA==
Date: Tue, 16 Sep 2025 13:27:24 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, lgirdwood@gmail.com,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Message-ID: <20250916122724.GB3585920@google.com>
References: <20250825172057.163883-1-elder@riscstar.com>
 <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
 <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
 <7aba368e-709b-49b0-b62c-f2f8250c8628@sirena.org.uk>
 <20250916084229.GG1637058@google.com>
 <c8bcfff9-9d2a-426d-9df8-100efd2af64f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8bcfff9-9d2a-426d-9df8-100efd2af64f@sirena.org.uk>

On Tue, 16 Sep 2025, Mark Brown wrote:

> On Tue, Sep 16, 2025 at 09:42:29AM +0100, Lee Jones wrote:
> > On Thu, 11 Sep 2025, Mark Brown wrote:
> > > On Thu, Sep 11, 2025 at 11:36:41AM -0500, Alex Elder wrote:
> 
> > > > How should these two patches be merged?  Mark has reviewed the
> > > > regulator patch 3 and Alexandre has acked the RTC patch 4.
> 
> > > We'd both have been expecting them to go via MFD.
> 
> > Why?  I don't see any dependencies between them (usually a shared MFD
> > header-file).  If there are no deps, it should be taken through its own
> > repo, no?
> 
> I used to just apply things but at some point Linus complained about
> cases where the MFD ended up not getting merged (missing the merge
> window or whatever) so I've been treating them like they had an actual
> dependency.

Not sure I've seen any of that from Linus, but I don't doubt you.  The
MFD part has been merged now, so it's save to go ahead and apply the
Regulator part.

-- 
Lee Jones [李琼斯]

