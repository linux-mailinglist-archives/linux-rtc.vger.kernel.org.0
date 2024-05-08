Return-Path: <linux-rtc+bounces-1151-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7978C03EA
	for <lists+linux-rtc@lfdr.de>; Wed,  8 May 2024 19:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E8831C22A60
	for <lists+linux-rtc@lfdr.de>; Wed,  8 May 2024 17:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9AC12BEAE;
	Wed,  8 May 2024 17:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RnI+CcNR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBA8127B5D
	for <linux-rtc@vger.kernel.org>; Wed,  8 May 2024 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715191097; cv=none; b=FNcUgdZBWg1xZBZvqw8A4hCA46Hcq7z/lSgxZZTNeqm4BFy+ZcOOZVXI32UEH/srwhiIpIxeqN1U0aqJHR3nFtbQvHVOWmSL4PZBDiFCGaBwosLJXCvENdFxi02OP+Rwsd8bkTEBzfNDy3sKxOYnPUIhz1xqFebrrPcj+CKTx9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715191097; c=relaxed/simple;
	bh=oAnkyw2u1tuMRwEGqoFF3kYVfQ2VW+JexMoHwifcZPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E183ItDctMio0jYlObRiNR7u0Ygw6wSe9W1CXX8r5xttTW7sgldRiJeJvQbeiOdEOqFb7yYEeMnyMas//fJwI1rJXMb75FSj1Ul2T2gQCvJUpW9UwIF4YgypBaw+rRIQ1nQj9wIgSsNG3/Pj0/P141BPcdoYLfXelw2ddVsfBCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RnI+CcNR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41b48daaaf4so11915e9.0
        for <linux-rtc@vger.kernel.org>; Wed, 08 May 2024 10:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715191094; x=1715795894; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tP92gBeKM0g50NbvJEhINxvEskd9JEwX7VJMOuk1fdM=;
        b=RnI+CcNR3EeBdqeQT9+euerupYSipUgIBJSpUeLuBruhqkxqJw5NvIpZCPSvjibO6X
         PaRL0X93vsuOUxZ1+gzjwtbFssTLWS/z2kloBrCYGcy3Gba+Hhg2c++X1Hp0oCUcN+Ln
         Q5DPmkXW3kOk5RLqKVbY+ZG/eeHQUdB4rE9ziy6ISyqf/RFZb2NM427Z0omGOAMoGf2V
         Xl0glvlcASemYufSNIoQGEJwBhHlSK0iXVt07vz58zCGufrJ9Wi/ZWNSFBg9RrW5xGjX
         Or6KMMXQqFqXK0LemyoosCkwp6QYJCPYFDD6JS95j73C0YCTxEqwi6fUwXhMpEd+Ftbj
         969g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715191094; x=1715795894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tP92gBeKM0g50NbvJEhINxvEskd9JEwX7VJMOuk1fdM=;
        b=J422AlN5Wef1zUyXcxsH6ZCGWNte2w9CpeK+FdpFPRspccA27DnnwKyfuoDDTCQ9nK
         07P65Y79101PbJkhXkaRXUT/7GgmLdPISHY8y1wTO1ZSTuYHYfCu18/xiPZGbp9XvYrE
         JkoP0DEkLHS+FTo5u4idL1HKB82lSowM59t2i4YgPczzF9GSNdnm9M8mxoYT7CsadX/u
         MpkgOsQ5dqk9W2keR6r7pPqyXyGy0OeX9M1EnYqIw2URQUXqv2ek8GtOCLT4mDKrKdN0
         7lC0mCuXru2bUJK3MjhHvQUJp7L8Rr1lo7QEMyi/GO815lQydm7EqFNAEIoBrrrP6Nwi
         6Xpw==
X-Forwarded-Encrypted: i=1; AJvYcCWXXHvyJVwI2p+/tysycg2JIE6B6dYeIlwncF9Vd1jTOCvKoplDgdTTUE7apbVSvqT2cfHQZUfjZ3T7BGmJhpTjNJPuKBzkyoju
X-Gm-Message-State: AOJu0YyKJZ+6OE4gLvwvoCNis4GkoOt7ZzPD79FG62AKxTOowaEyFHdG
	SnmnuYzahU4u/2hCFBMUmV+BPm3r0n+i3ycTbDaptHrXf83lZhUnEP3WxgYWcjIqgvj4HeBcx4O
	1pHywnFgJNlho98o4i6ZJkeX/trjLcLPjqkf3
X-Google-Smtp-Source: AGHT+IFjj1yUgxdvjtSgv3LgyXpcI3FLi4pwx211hiAyqt7zaZ3U1fvnHgUlzN4XkjFuzQVfOZTRgr50QjxapUmY190=
X-Received: by 2002:a7b:ce98:0:b0:41c:a1b:2476 with SMTP id
 5b1f17b1804b1-41fc38608b1mr95865e9.6.1715191094177; Wed, 08 May 2024 10:58:14
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507063534.4191447-1-tao1.su@linux.intel.com>
 <20240507100651.8faca09c7af34de28f830f03@linux-foundation.org>
 <ZjrpieLKXFhklVwR@linux.bj.intel.com> <20240508070003.2acdf9b4@kernel.org>
In-Reply-To: <20240508070003.2acdf9b4@kernel.org>
From: Edward Liaw <edliaw@google.com>
Date: Wed, 8 May 2024 10:57:47 -0700
Message-ID: <CAG4es9Xdo8fBEpZLWGFHodi7=+ZYLvrE-kQYt=YfCeEHWYxaXg@mail.gmail.com>
Subject: Re: [PATCH] selftests: Add _GNU_SOURCE definition when including kselftest_harness.h
To: Jakub Kicinski <kuba@kernel.org>
Cc: Tao Su <tao1.su@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org, 
	ivan.orlov0322@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	shuah@kernel.org, seanjc@google.com, pbonzini@redhat.com, 
	bongsu.jeon@samsung.com, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, alexandre.belloni@bootlin.com, jarkko@kernel.org, 
	dave.hansen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 7:00=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed, 8 May 2024 10:55:05 +0800 Tao Su wrote:
> > Back to commit 38c957f07038, I don't see any advantage in using LINE_MA=
X.
> > Can we use a fixed value instead of LINE_MAX? E.g., 1024, 2048. Then we
> > just need to revert commit 809216233555.
>
> SGTM, FWIW. The print is printing a test summary line, printing more
> than 1k seems rather unreasonable. Other facilities, like TH_LOG(),
> should be used for displaying longer info.

I also submitted some patches to fix the _GNU_SOURCE issues here:
https://lore.kernel.org/linux-kselftest/20240507214254.2787305-1-edliaw@goo=
gle.com/

I'm fine with this approach.  It's aligned to what Sean suggested
there, since it's causing a lot of troubles for the release cycle.

