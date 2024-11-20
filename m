Return-Path: <linux-rtc+bounces-2578-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE0A9D3D9B
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Nov 2024 15:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1ACA2811ED
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Nov 2024 14:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678C11AA7A6;
	Wed, 20 Nov 2024 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTSONToU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77A4A939;
	Wed, 20 Nov 2024 14:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732113157; cv=none; b=CYxLIEaD0HNump4+hfj/gZuOyd6VmD8krXTr3x4IChaLR6kRjlDJAZwAyYWsR6UgkAlVoJUDOySzthT6bLX8HSTrKulk2goWpLP3xAeM5cDJffrOhL0XOgT3TbcG6qDzVxHLPjhGQKXVaC2eLlnOjWdNoUfjx/4j8YKliXQdSRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732113157; c=relaxed/simple;
	bh=re6SqNbWzgzWriy6ggaNhl6E2wD6B8Dv3fx1ptxR2NI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iRGc0Pjk+Cf6vduz4bZZ6+xANw6QBPXeGzTtJF3VuYPTnc5POMzcHRRYy679X3ebuxFpktV6fh8AepZbRZZNDXmewmchmN/VnTZGk9K94SQggThx01IbD0Kg/MGcQKoi+n6XmuFqcZeHgUQ8rR9TXK2z9fGCSjkJUPjGVpj1XIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTSONToU; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-a9e44654ae3so886789566b.1;
        Wed, 20 Nov 2024 06:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732113153; x=1732717953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUsZHDLoQUbtgcasZun3ENnrBrDGzgDwOX2ETmF7VrI=;
        b=eTSONToUDSuKKZiRTF5bBTqDTC1BDRlQktXMFVpZgAecURmQ08V1wN35DB8VHLkfRC
         TpKFKe5CZ/Z9ImE1ozh5qEuXBXoq60RAUHd2ydWJrEN6QY0u2jO0Aw8fj4JtGKcaE1RN
         Zb6QqgqwsAEtuSSY64/8lD0SYFfsYWyOxLN7zq95k4caxf7a+8pT7M380GNG9kVj+52n
         ayXyoBBWT76zX9jvKr9VO3d8ucBhKXIr2xR38zY7nI4Mp8YSLpFe0ujH8/wY6eOGExBA
         3D1pGGQRvqDJrTKWVVKhexpRMofoMZlentWy9HthAEfdhNuS5OvfCYcE0LNYvvYk77lm
         kayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732113153; x=1732717953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUsZHDLoQUbtgcasZun3ENnrBrDGzgDwOX2ETmF7VrI=;
        b=s6UTIYODNPyCljOu2b5/fUYCD5EfnCrFaz9I/n+pHv07CtrrXzDni2aVFQQTcaq8Cc
         aMUYJpkI+juNUoWDduUQyGAEeRv+r9323YGr/h1Xlfw/LlxJHIwf9UL85KiWct2wU37C
         Bt3LEuZ6BVfChAg8hqvdRqOcqRsaoMBoDGHIBp0txQjjSAavy/z5t1S1Sm+gZj28P7tl
         AZmCJDJWvF5rU7J4y8JLK3GSk1yaN5r0W+apxgZ6NUhpnkAoKu/JqZjyXs2YPLDZsT82
         WlsRZ+xJl3ndwRqE7NSCy7U473pIm5EnyCAMvPJfNWw990pZsIj4O/WYFW/HeRZ2dbKY
         oGeA==
X-Forwarded-Encrypted: i=1; AJvYcCUR1e7LbqFwRz6LOffudsWerJmGuyE/AXWSnIhxzp2HKGeWiezLmoCPqZ+75As5RCsnYlYC4wxUnSo4rg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxApEdHrw830nJWCY3tl9T5ANEt17DAAE1S9xCEZ+KX41Fvx4i6
	hhhVHrw9ZsksaAUGUkTYzdVldo+nUnwqFFFD3tTXMsCqV/kePFP4jzJ4XbLh1AgXxKDyGQgBIQz
	6S6Re7bXdeE4T8c2HzPHueAqTiZ0=
X-Google-Smtp-Source: AGHT+IEMkNm9u/aDHhYdaOYV4LZ662B9EpY8jCLdFtqzclDlfmICB47DJ3aScSQ3RR1mJJBIO8H1sy6Irq6f1BRv0jc=
X-Received: by 2002:a17:907:97c5:b0:a99:f4c3:580d with SMTP id
 a640c23a62f3a-aa4dd723faemr272688066b.42.1732113152789; Wed, 20 Nov 2024
 06:32:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011043153.3788112-1-leonylgao@gmail.com> <173136306889.3322178.5149197946199507685.b4-ty@bootlin.com>
In-Reply-To: <173136306889.3322178.5149197946199507685.b4-ty@bootlin.com>
From: Yongliang Gao <leonylgao@gmail.com>
Date: Wed, 20 Nov 2024 22:32:21 +0800
Message-ID: <CAJxhyqB4CfLBwfgcDQFm7KZBwom58SPJvTSXdUTo+9saW46+zQ@mail.gmail.com>
Subject: Re: [PATCH] rtc: check if __rtc_read_time was successful in rtc_timer_do_work()
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yongliang Gao <leonylgao@tencent.com>, Jingqun Li <jingqunli@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre Belloni,

I've noticed that the post-failure process for __rtc_read_time
requires careful handling.
1. Need to call pm_relax.
2. Potentially need to set the alarm to ensure subsequent interrupts
can process the
    expired timer? Could you give me some advice?
Should I continue to submit a fix patch or create a v2 version of the patch=
?

Best Regards,
Yongliang Gao

On Tue, Nov 12, 2024 at 6:11=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On Fri, 11 Oct 2024 12:31:53 +0800, Yongliang Gao wrote:
> > If the __rtc_read_time call fails,, the struct rtc_time tm; may contain
> > uninitialized data, or an illegal date/time read from the RTC hardware.
> >
> > When calling rtc_tm_to_ktime later, the result may be a very large valu=
e
> > (possibly KTIME_MAX). If there are periodic timers in rtc->timerqueue,
> > they will continually expire, may causing kernel softlockup.
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] rtc: check if __rtc_read_time was successful in rtc_timer_do_work()
>       https://git.kernel.org/abelloni/c/e8ba8a2bc4f6
>
> Best regards,
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

