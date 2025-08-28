Return-Path: <linux-rtc+bounces-4782-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE6BB391DF
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Aug 2025 04:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 631111BA5807
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Aug 2025 02:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D8826A091;
	Thu, 28 Aug 2025 02:51:13 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A40C18C03F;
	Thu, 28 Aug 2025 02:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756349473; cv=none; b=ZipZNPyRLMPHxqTZblTpZwloEC/8HNKFPfS++No7x6B3PW/YZMcZp18S0ckdg1YF8wN7aIdlFqq+KrUxYejoLxbL20AvBUkbJRIKgFztvjBSVldvjnMGa6tr0eVGaoYVom4BwG8CGEJDtjB/5j6OBQLvZrO9AITVWPc17u+u5c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756349473; c=relaxed/simple;
	bh=Tr8fRegpwWz9Z2Jl9ViCSuc9Ne2scbBZyW6N5v6Io8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mSPWQCt8bOMR1Pi+yghKRRMKRb6T2ielNqBBrhCWqv/dYW6f/Qlx2lkymMTUShVz1f+sPMAgCsRkpESr8mG3pgwpJ8mmAt6NlzvSo08cVY/i1cMat9WwKL6AgesYLErg39qez/ByciF7vBbfS64xQljhNF6SPLsIsrpxtylcFis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6188b7550c0so661344a12.2;
        Wed, 27 Aug 2025 19:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756349469; x=1756954269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tr8fRegpwWz9Z2Jl9ViCSuc9Ne2scbBZyW6N5v6Io8g=;
        b=JEZI1mBp1IDwc2S6Hti6/jWlj9vypr6TysGeKkiN0Y2LqvYbddB7f8Zl/acZRRQi+/
         t/YyoY3mBDuFJic8g43/IYQPr65GoSmTnc/cyfUK0C7JPHxxZDztCII0ANukd4Cxlo+J
         6ygq2PHD1BkvSQrqgUoDyKA0tdn1LyNFVEJlEz9KIvAF5idvsmV/QAcBuesTw6GnoBUu
         N+v5goSb46CNvKFdCko8oDKV13TwurU8PVyfN91Sh0R7rceJcBkq/IWWuckJ5IkWYbWQ
         xgk7k3c8lWMY4Lasay7O9UxWT2rV/7eG9hTkFKXKkMzLZpPBNqCXDEkgWT+e+rbw1v3N
         BZFw==
X-Forwarded-Encrypted: i=1; AJvYcCVTLnCD0DFtjma2EDDc/5vGWY7+hksRLtQAOjRy2ctIR1ICAcoHzLjS8aWViXbKfFM0j/n2YMZG7CI2RqKB@vger.kernel.org, AJvYcCVbZpjO6hl9/efDf2Km7P/FqLKoRnjtz1YvayVBmsihO7/N+HOIfYxc4I6cLAzeQyLPj6/myKksgwUvE6I=@vger.kernel.org, AJvYcCW0ABObZbZGBe8CN04X6LlyIaCr2Bk1KjELSaBGZjZaCgilv+eAN+5DW9mcpKiQl+ZFH7R/a8QB5qx0@vger.kernel.org, AJvYcCXMs0zv7Lz8GtgEvWtchWtc4uA+D9+reS8lCg9Azf4kIq/WuoQCvd7F+rhxibmi18URSv7WKAynEni17y8=@vger.kernel.org, AJvYcCXllsk/C83Vz4Hngh3Cf6nGWAicIpWrw6GQHmRB7s8RDCKCuSQjcyXDA+wKrYMKKQkztvhWNHBSXqzP@vger.kernel.org
X-Gm-Message-State: AOJu0YzIgHbaX90Z+iyBaiamr4J4hRIQnh2hqr6C8AyOzSDP+JML/zq9
	EC3/U//AnmKqgyIrqwrZXTvPv0omQpx/KMpZ2NcKLiXhFpEcyKdKl4jfKRM7gOdjjDY=
X-Gm-Gg: ASbGncvGybZ3DCXLHiAz9yo1uYAkitwThg5wafFc/ADwoo2FdwUX5oy/p3ibNQSHKjF
	DrJBKXcis26r3vvjUKyNfF7qyG1BXumv+RzanF1+BGoHm5BrU2AcngghgWWwlEKOrPbO7nSoEgr
	YqHoL1lHuXILmwX4vHwL+3h2i74TJYs4qGzN038DAJoKEkQdrlsdBAs+D+bB3p5Ps69D3EkJW07
	uQUNryBd0O4QNGAOoEDv4fXcQTY77Pj9j/QyfJonKo08fMsboYQZA8OL/ODK64KrPO/st16IrBs
	xoMTRzBG57FOmP8uF6mfpqN0ydwLmZgoouBidmkCqTxORwDQqpTzUrvJaCJXw9eAnDpzHVIDsPF
	WF5XSryvQKgxpj7RTS8xwrSH5r2bugEt7xL8zmVgGScRdU9IrL1vMAW9Z3yk3DLrT8g1tY1GeZy
	z0yYPO/OT7Vm7kB7WdV7k=
X-Google-Smtp-Source: AGHT+IGdoSA6ptpVbDbcC1qJbeVhBGVVizt1XnHNTzPZ1dTjQe/jiSRrDykc85FWrsgAwBnqtfuTZw==
X-Received: by 2002:a17:907:7212:b0:afe:8eb8:91f with SMTP id a640c23a62f3a-afe8eb896d8mr1013305866b.52.1756349469319;
        Wed, 27 Aug 2025 19:51:09 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cc7d858e1sm1180804a12.20.2025.08.27.19.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 19:51:09 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61c4f73cf20so819502a12.0;
        Wed, 27 Aug 2025 19:51:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/hNYtmswRgiJJ8O10ti+oVkkVZ7W49QpKjsFYUzg0tWQLS5vQzJDFcC09uGavnSU5ab/7yB+qcKno/js=@vger.kernel.org, AJvYcCU0XdtmSRrcn0eHFELzrorDsMubCsWyc8Onz1FGOE/w3Yb/2hG/e7Yp+D4R0MyLMURWPQ6Y6hMtcLCqttTR@vger.kernel.org, AJvYcCUgeSpvNQYF4LxF8gK+u8qCff5OJJzVGKckWq+hKXY7hs3BH6vIP+hjZ7zkwoKnzlTK1WdaCFtk/Vk+@vger.kernel.org, AJvYcCWU2SJ+aTDHjd74at0UzOjlJg3tIFTbXk9Pd+qIvLKOO8ySdBprXStCkP4Oa8h38pK1V/9wscGrFp+w@vger.kernel.org, AJvYcCXzQOShJuE8dFgejdzmcur3WOn60ZqLkYwstVmpe7u+phRSYfk0yEYL8dlAShH7bbHiE65QCIju3eK+SUQ=@vger.kernel.org
X-Received: by 2002:a17:906:4786:b0:ae0:ad5c:4185 with SMTP id
 a640c23a62f3a-afe295c1d7cmr2038306966b.57.1756349468922; Wed, 27 Aug 2025
 19:51:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <cff7c8d0-cdd8-4ba5-864a-936a059624d8@roeck-us.net> <CAHgNfTx32B4p6U8Z+dy02jWdQhW0uR3ytovc5u-3bE8kNk=p4Q@mail.gmail.com>
In-Reply-To: <CAHgNfTx32B4p6U8Z+dy02jWdQhW0uR3ytovc5u-3bE8kNk=p4Q@mail.gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 27 Aug 2025 22:50:32 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_iyVc-VAUAZa8MNwhBqc301R4qTbKghYqJiw--5+DvwQ@mail.gmail.com>
X-Gm-Features: Ac12FXxvfDB4kcNEaDqCMIyxqJYPH_rJJ8_AlceL3uhtx24kHMPD9Nj5WNKrAVg
Message-ID: <CAEg-Je_iyVc-VAUAZa8MNwhBqc301R4qTbKghYqJiw--5+DvwQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jean Delvare <jdelvare@suse.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org, 
	Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 6:07=E2=80=AFPM James Calligeros
<jcalligeros99@gmail.com> wrote:
>
> On Wed, Aug 27, 2025 at 11:47=E2=80=AFPM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
> > > ---
> > > Changes in v2:
> > > - Added Rob's R-b tag to RTC DT binding
> > > - Removed redundant nesting from hwmon DT binding
> > > - Dedpulicated property definitions in hwmon DT schema
> > > - Made label a required property for hwmon DT nodes
> > > - Clarified semantics in hwmon DT schema definitions
> > > - Split mfd tree changes into separate commits
> > > - Fixed numerous style errors in hwmon driver
> > > - Addressed Guenter's initial feedback on the hwmon driver
> >
> > Don't you think that is a bit useless ? You might as well say "Addresse=
d
> > feedback comments" and be done with the change log.
> >
> > Guenter
>
> I don't think this warrants a v3, so hopefully the amended
> changelog below will suffice.
>
> ---
> Changes in v2:
> - Added Rob's R-b tag to RTC DT binding
> - Removed redundant nesting from hwmon DT binding
> - Dedpulicated property definitions in hwmon DT schema
> - Made label a required property for hwmon DT nodes
> - Clarified semantics in hwmon DT schema definitions
> - Split mfd tree changes into separate commits
> - Fixed numerous style errors in hwmon driver
> - Removed log messages sysfs read/write functions in hwmon driver
> - Removed ignored errors from hwmon driver
> - Removed uses of dev_err for non-errors in hwmon driver
> - Made it more obvious that a number of hwmon fan properties are optional
> - Modified hwmon driver to reflect DT schema changes
> - Added compatible property to hwmon node
> - Link to v1: https://lore.kernel.org/r/20250819-macsmc-subdevs-v1-0-57df=
6c3e5f19@gmail.com
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

