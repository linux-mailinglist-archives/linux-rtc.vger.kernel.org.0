Return-Path: <linux-rtc+bounces-4665-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC885B20771
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 13:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB42B188DD9C
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 11:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BCC2C3240;
	Mon, 11 Aug 2025 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXFujpC/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852B62874E9;
	Mon, 11 Aug 2025 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754911307; cv=none; b=By9ZAhzlA5L2mZZVnbgYzMvFWxrOISt63NGoNPyhC+6IggjR7GKjOnPjttw2ZpS36WvQYEm6q+690PhodZONCPfj9HqXu3DQ/zit6l6/heZRRNbdNB2CwRWWDnxVSmC+CWjLX5uQij+FNMqyFnkMo4lUZPPepVpHj6Lm85jVBYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754911307; c=relaxed/simple;
	bh=fJBQEdPBD8Fj/DZRBtUbIqsLDInvdTBnfhxQ/d5rsZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQWDxVdf3FvU9h6fUgqHVuAG6uVvmjFkATxc771j7zjmpsWT27r6Wk5RH5xutizr7+M1Vgc3YQmonh0pq99Up/zMIVwKwNyJAgGyrtYT2axiSzMUBAr9XXzFMOduCXlWAxRg69mbnZtmBoV83SWojRwogRchLRCbahysI94hZhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXFujpC/; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e91729232d9so55205276.1;
        Mon, 11 Aug 2025 04:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754911304; x=1755516104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oua6uu1FsiEG+FbQxDQznAhdN0yrac6Ee4wtUSAb7QQ=;
        b=VXFujpC/DO2tWty6bkh/3Y6pxPm6j4WwMDuIlYGF/E6NR2CRUDarcZybuQyzLrTsO0
         h9wh5PFmEhqpWi4OLhBOSVOdDFumRpdnQoHBG9RCstChaoTYD7JX7YE3PDUlMBSL7TfI
         Uf6urqE2iDP8tLvgdoD7MYbrsBZJEzgOAuw+1m/BseTgWBvc7NgEzQMbQBYlKRJg07UK
         xEORWp9PFGg1X95KVCI5GsWlV/7lA7CjRYo/JrL1JpEr4F4ohOlzfRyGzKABedzViQ9a
         RSso/dbTpZjozCIEmidBfJxhQQcABftil2WRSdr7lK79QQmOIRlK9AKBRcdgKbzs+s5F
         bmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911304; x=1755516104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oua6uu1FsiEG+FbQxDQznAhdN0yrac6Ee4wtUSAb7QQ=;
        b=bebQBPzd8IjBwHThrRbj117RVqVzKdyib205VWvZOHR8iFmGJjQK7YPl+1SNb/GT9N
         rLx3lSX3Q/ROsT9a7dqZzJ5V5q0Xp1tZEt/L0to06h6k3zo0QwxQF3+XVb2IE8VuthJx
         Q5QlLhfbJNoJfQMnB7cHFntRx5eQHr0Q94kMkdaMFiLLZtcVhMIfLL1KqILbwuLhgNnt
         G3hVuhk6Ul68+WQCd0kAVvus0NhCNjLhb8lxPcrjJBR/wPI111zntqLtNL1cbVjnsVXw
         tqiAiJWgfghJ01U/iYTFSvfvqxqLv4tWRB4DUZod3daSik/cSmi6MLldwfDkdWDB4LEb
         c2IA==
X-Forwarded-Encrypted: i=1; AJvYcCUKDXM+ShDDcHKQdVVETy/4ezvza1CtsOHLMZmifrYrDNmX4ok8Bvyuo1ybMJ8gWZ33xby2rPSEl8iD@vger.kernel.org, AJvYcCVz+mPUn1vgayIth5fe+7cgqb82zOqua3ejkOlCJ2JsaHBPTnn5Hzxlewh40zAxutCazmNkuFcQceS3VGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOOlnwbDBi8LncTw29vexjnmS/+HIYqIZ6R2WT8BbXdV4ifrHn
	RgLR7jbEAV65zgdcOhVVO6oIgsF16KNqnQKijOcS+Qw4bTH6aEOY2AR9TZZXr20jlU3L2FuNiKV
	IRmLpjHOohnpN+4tNeeAnLANAgLJh/ZU=
X-Gm-Gg: ASbGncs/O2EuYCF8sOqA8N1/SvwTc1PuIg9VV512j+9poJeSI0ONV4gFxD9Di9uCCwh
	KEpqY3Mm0haj+jyAp3tlR0owhWPds6dfcrG3vS7xOXpyuLEWt98v3RJTsH46pL5uPYVro9HTh9v
	EcC753umtdh3OuPKWdZXMlo2RKrGSZrBOirA6PmNrHQSqxXHgANpW0+1Sldkg5HMDMl6AwKhyZI
	iW5
X-Google-Smtp-Source: AGHT+IFal31QTX372Rt1MAx31/CoJRJqKRAhiiSHSEoIDYyMcyqwKzlo0opbeNHOvKi39NcCyTZhsFoMxqBqcu6XHeU=
X-Received: by 2002:a05:690c:630b:b0:71a:2130:a8ef with SMTP id
 00721157ae682-71c083d4aa4mr54748447b3.7.1754911304256; Mon, 11 Aug 2025
 04:21:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
 <20250811081543.4377-2-ot_shunxi.zhang@mediatek.com> <b41749ae-640b-4911-976f-8aa36d40ed6b@kernel.org>
In-Reply-To: <b41749ae-640b-4911-976f-8aa36d40ed6b@kernel.org>
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Date: Mon, 11 Aug 2025 15:21:25 +0400
X-Gm-Features: Ac12FXz5R8bUd6DGN4oYRK6orLAYYfuyZ4YZlmfC6PZBO9X7PAQ1xeup1WjaCmM
Message-ID: <CAE7dp2rxfgj6FKoM-kesX8632t3AA7Lk5rC-uasyQUS2hQuUfQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] mfd: mt6397: Add new bit definitions for RTC_BBPU register
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ot_shunxi.zhang@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Cc: Krzysztof Kozlowski <krzk@kernel.org>,
    linux-mediatek@lists.infradead.org,
    linux-rtc@vger.kernel.org,
    linux-kernel@vger.kernel.org

Shunxi,

Can you confirm whether `RTC_BBPU_PWREN` (bit 0),
`RTC_BBPU_CLR` (bit 1) and `RTC_BBPU_RESET_AL` (bit 3) are documented
in the MT6397 datasheet (please cite section/page)? They look like
standard RTC controls (power enable, clear/reset, alarm reset) and
might be useful to include, but I agree with Krzysztof that adding
definitions with no users can accumulate technical debt.

Suggestion: either
- add the definitions when a driver actually needs them, or
- keep them now but add a short rationale in the commit message
  (datasheet reference + intended use) so future reviewers understand
  why they exist.

Also: please split cosmetic whitespace fixes (RTC_BBPU_KEY) into a
separate patch to make review/merge easier.

Thanks for the patch; I=E2=80=99m following the thread.

=E2=80=94 Giorgi


On Mon, Aug 11, 2025 at 3:03=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/08/2025 10:15, ot_shunxi.zhang@mediatek.com wrote:
> > From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
> >
> > This patch adds new bit definitions for the RTC_BBPU register in the
>
> Why? There is no user of these. Don't add useless defines.
>
> > mt6397 RTC header file. The following bit definitions are introduced:
>
> Hm?
>
> >
> > Signed-off-by: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
> > ---
> >  include/linux/mfd/mt6397/rtc.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/=
rtc.h
> > index 27883af44f87..001cef6b7302 100644
> > --- a/include/linux/mfd/mt6397/rtc.h
> > +++ b/include/linux/mfd/mt6397/rtc.h
> > @@ -15,8 +15,11 @@
> >  #include <linux/rtc.h>
> >
> >  #define RTC_BBPU               0x0000
> > +#define RTC_BBPU_PWREN         BIT(0)
> > +#define RTC_BBPU_CLR           BIT(1)
> > +#define RTC_BBPU_RESET_AL      BIT(3)
> >  #define RTC_BBPU_CBUSY         BIT(6)
> > -#define RTC_BBPU_KEY            (0x43 << 8)
> > +#define RTC_BBPU_KEY           (0x43 << 8)
>
>
> Why?
>
>
>
> Best regards,
> Krzysztof
>

