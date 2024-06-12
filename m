Return-Path: <linux-rtc+bounces-1288-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB803905A69
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2024 20:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 796BAB211C2
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2024 18:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C0B17D8A4;
	Wed, 12 Jun 2024 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r4juKz/W"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA45E1822E4
	for <linux-rtc@vger.kernel.org>; Wed, 12 Jun 2024 18:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718215770; cv=none; b=at65TUfjJvULMnQuWqt5Emf/60iL0P1D8hL/kA0tM/q3bbR457J445U9QFGETOW3Hl3JrJUWqF0y2jf6Aq6+idV5ycgqFhq2s6fb09b/YjXpAfV5gy/GxWUwR4XV/OwmhxfGOp0+q57TL+zQQr42w7RSPs/UA/sZRVL4+drcPtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718215770; c=relaxed/simple;
	bh=OpCQrUctTQkygU0haUw33jiZZCG3WA4Rq3pc+c/p3uE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SaYGVlKeJBiyALHHny4iXJJds3jQR+9LvnzFrWjpTLEfc5zpu1PK08vLBOrHKuRz/5RB36uSicPAAwMdUc9wHd+Lktx0uhMpZoG4vGi8iZbXCemGg0FPNIHPCsnc8wTfxvLzP1lZJJzUVaL+oUfHITz+J5q3bYka6cEtg8sgWVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r4juKz/W; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6f1da33826so31508966b.0
        for <linux-rtc@vger.kernel.org>; Wed, 12 Jun 2024 11:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718215767; x=1718820567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l92b/5DrjekKp8e3XrOGYZ3s5ZJzTcQ9Xwsy82BND8Q=;
        b=r4juKz/Wq07gQ9jGH7p+xoWWW+ElyqxE5yBO2dLCqx3528G5mPHx4yJa2f7DrVlgEg
         lytGjMFjMDyckgggDbaHEDdUAdJGbsS7uJpboHEK6LXy6ewVbODc21j/CKoAO4z24+7D
         n1eOTXtYF+vC8qFPooWL6XI1fI8cutuWXCdfHw8wROuRfVWhe8JJSSFWLkhTkEXYiThL
         NffV90sLnkmbDoA4QJkB0hDqEUr8XgzXh9ZnCmKqXX/gxKZezJ0sTx1jyDL5WY9MF0u/
         lQywAbkACMkEuayBJEWlyQeU0z/wgxvXT4uKok4WKgz9dWk1zy1E7cPeAnbgueEAIjaH
         uNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718215767; x=1718820567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l92b/5DrjekKp8e3XrOGYZ3s5ZJzTcQ9Xwsy82BND8Q=;
        b=UULYlCOdLJ6ajAQvFEIx82nLyAbTq5e0gzsWNPt2kCLO2+GVnJZW5B4J9tRMeeX+Jy
         bwfXgsUZYyRonavesEUgbwJhV3AL0dLkw0EPtRcOeOl73wn8sdcjL8Hk9nkRJ3bOyUIr
         WDJu1JYBZFiWX3RAF1DcBYzgUywO5p+caMJDpSHuhHIoFdHcy1b/VWhk0J5ecqd9U2Z9
         XN3eO+3gJVV0XkWr25CXf4SPWB2CPZCFNgtsbg6Fv7WM5gcsAz8rmoY+b1dwEHUrLyiD
         Xjh2yBc9/Bh4DGEd3DkexBLyrnkk9dPVYEmuRuVeJHV+KU3rBNn1o5ktbTJ5mvEgXnrD
         I2AA==
X-Forwarded-Encrypted: i=1; AJvYcCXGmRULDQqGZlrnAVjmIk7K6FZXXz+kTu8gQsDLeLAPedAfrJP53KCpI5oyiqQwf7C4qBf/YzLu0rFch0KL3jZYEP/EideVAcjj
X-Gm-Message-State: AOJu0YzB6IQJIA+/A9ekgMSidJKrevjyHNYBPYH84oU5nWeF6c8PhgXK
	igubdteCaMrrNw0DysRmSvGcEZCUAHjaQzlTQ236xrIhTp/DxDg5ekeFeCyLHH3Q7PEX2aHC1QQ
	+9MehC+2yKGvck4dHbF8B2Gg2M6y3I+xDbUMU
X-Google-Smtp-Source: AGHT+IFoJySlhEqqeIJxstIwf57K8OO1bOTxQwuPn8ujwtJC5BCzX/NSAZoh9iVmmn38D2FwKTemlp/xE2cQY105Aes=
X-Received: by 2002:a17:906:1d55:b0:a6f:2253:d1f7 with SMTP id
 a640c23a62f3a-a6f480086b4mr191168066b.61.1718215767028; Wed, 12 Jun 2024
 11:09:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612083635.1253039-1-joychakr@google.com> <f2156a50-0ee0-479d-8d60-3255f3619ae5@moroto.mountain>
In-Reply-To: <f2156a50-0ee0-479d-8d60-3255f3619ae5@moroto.mountain>
From: Joy Chakraborty <joychakr@google.com>
Date: Wed, 12 Jun 2024 23:39:14 +0530
Message-ID: <CAOSNQF25nducTP-s5T55r6kJT9R13mEy5TQwrxr6JtEoiq=W6w@mail.gmail.com>
Subject: Re: [PATCH] rtc: cmos: Fix return value of nvmem callbacks
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 2:53=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Wed, Jun 12, 2024 at 08:36:35AM +0000, Joy Chakraborty wrote:
> > Read/write callbacks registered with nvmem core expect 0 to be returned
> > on success and a negative value to be returned on failure.
> >
> > cmos_nvram_read()/cmos_nvram_write() currently return the number of
> > bytes read or written, fix to return 0 on success and -EIO incase numbe=
r
> > of bytes requested was not read or written.
> >
> > Fixes: 8b5b7958fd1c ("rtc: cmos: use generic nvmem")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > ---
>
> Thanks!
>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> After we fix all the these, can we add a warning once message to detect
> when people introduce new bugs?  It could either go into
> __nvmem_reg_read/write() or bin_attr_nvmem_read/write().  I think
> bin_attr_nvmem_read() is the only caller where the buggy functions work
> but that's the caller that most people use I guess.
>

Sure I can do that.
Yes, I think most users use this via sysfs using bin_attr_nvmem_read()
hence it works.

Thanks
Joy

> regards,
> dan carpenter
>

