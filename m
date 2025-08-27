Return-Path: <linux-rtc+bounces-4781-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF20B38D4D
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Aug 2025 00:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D5BE1C24535
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 22:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F7E3218DB;
	Wed, 27 Aug 2025 22:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMCHxakz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D194032145D;
	Wed, 27 Aug 2025 22:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756332438; cv=none; b=A0pHd1wuqOKMPdZUpFhA7GbN5efgxxQgZdSSJ9XcVoVGVa2G1G5F3GWRvcmSKcrHFFHl/2jApw8cPG1vWOnJVCRqM55gDcuhsEIJbkdWIeB64NaIhE5Ru93bst+rCTR3J2qptjT4uKRyx41avp6eZ8+Wapyq7n4cMyZJPchUjtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756332438; c=relaxed/simple;
	bh=vUC4qlsxVvPTVPExTfWGe5A+3iWqGaWbw/x33NuF0r0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ACywZF10O9ymwyQDTznDRxJE49DxblFA0GCRulruwC73m0J3UCxHwi3uth+N5Vly4wZzM0Gc5c9ui1N+Z0O+T7N0whpReIgU0cSwCddt5texc2zVLqeoygloeeetkLyq2Q3rhE5WG/cXECoG3HYkn6hwrOxbP4bLbj/LFetOTmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMCHxakz; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7e9f7c46edbso123373185a.0;
        Wed, 27 Aug 2025 15:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756332436; x=1756937236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUC4qlsxVvPTVPExTfWGe5A+3iWqGaWbw/x33NuF0r0=;
        b=IMCHxakzn7iSdt1dvuMKQCTtmgFmSl6phVeR2J8CTA3p4hwBjYLX2/ELkZCbT+iMLS
         3na5j1rxRVVeGfHLclYhDgxGQCeUjyOe32D199F6OAieTJaehxqf0hOaUQUEsRgYMtez
         2SQ0CvOvU+6kYCbEfXfB7lNqHBBJVLTH+DkxAfy5owUockcYgUqQHYN+BWiY4ohvOzt3
         eR88lFQiF8wXKsEPnXAGnzK6RpltkQ4pRDRONyrfa9dJoMacHSfK274WZB6ZpODvdhFg
         3dTdz35u9Nhaei1Ig76ScyGax6SpU7TrCnplmZtMTbEXOHbdp7uA7Oyf+s+FHqWpGpuR
         5AmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756332436; x=1756937236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUC4qlsxVvPTVPExTfWGe5A+3iWqGaWbw/x33NuF0r0=;
        b=AVlJRZ5cAhmSYcjsHfRasXplTnBEyKIwvFW+z9CZmEXZalFe52xg8SqeKOFca+3xzc
         K3xtCzWGxFrIKrAUXt2pHheJ88KesLEaWoGySvmu7f4Qr8jfhOyQdsO+kGyKHMGLkVKu
         JLIflUiomHqf9b+f5hi8ifFeT3IaZDxjlYEnu3WwccjreIzfjwpYc6a7JlHCnZs76fnP
         jMb/QSUS2bC0h8Gk5kkcukeZlM75pkOA8ot9iUrMug2Qw8liX6AXEfhTP6wQ+MG7N3zK
         mLI+G6ubjtC6Nkfv0AjkD9FTBsVnok0pAsUk9oN9TO9FWJfogXA0JyX2ty/cI+psZ1s6
         Qutw==
X-Forwarded-Encrypted: i=1; AJvYcCUuIobgwclCajpdQZFiycykzLIW5FI8GcD+15sX0xRfKX28VzomlZai03Yqo63L8+neB0Pmd8mm7pW+qoQ=@vger.kernel.org, AJvYcCV2PuyePRT2VaaONGqj5w6/MuZWyqH/v0tot66tv/M52WlSJlhwsZnQ0+RnimbUtsYL/948Ljwta7Kk@vger.kernel.org, AJvYcCVTHUkuDOmuIWHfwMVlyicfMOI62qTTH/2jkRSxL9hUL06Ki/xCET9iLNUmacyGpkECewH0+h/5tDPD@vger.kernel.org, AJvYcCWyBaBiTJseS26/5HhT/rzQy5GfzDcnV1h+5Tn9EwbolrskKA0VwujQkW5WxyC8WbGq0QN5533f1n5DDqM=@vger.kernel.org, AJvYcCXVpZNG6L28WBV4HIXq8/nJHQ4OKuHB1jbGuhBws/RpvuKI/ioRvHDn51mfFSU319bYxrRGVjk4J3+ieqSk@vger.kernel.org
X-Gm-Message-State: AOJu0YyDb2+G69+2iCrPVxkbPVoMsblRzJZe2IjboOMy3xh/tq1dbEIk
	o7kW2L8O0LQrL56voNmDki4fx05hDUYnwq3AWosQG/6WaeCAJG/+ncWjmDEBtT0dgCoxBe56C85
	YThmAr2Z55UUSO8giQFPNP9wTMma0hF0=
X-Gm-Gg: ASbGncvhQB8Aqxd8nt/rqdNP3BLap/i0qxe7M7yFOdKZuyH06On/kxP/DB4Wuab9LMb
	wanuHPZHk1uI0mpuFVZA60EFeVih0uOQvLuOVnknjDXByY83lQY32n83Uet+rPYKCzNcidRlkSk
	MaSqnqRwEichnCjRRkHhPy4upj8Z3Eq2FMQs9RzrVozN54mluK1dp9tXqhiU6RywO/XQj4e15dS
	p3eog==
X-Google-Smtp-Source: AGHT+IFWnq8ORXAI8SSjemzLtCbxSTUPIYIEaJ5tGH8UF3103yXoCHbrBxVEF+Bu2TrfLXMCEXU8uRfcWJlgWZbs5Og=
X-Received: by 2002:a05:620a:390a:b0:7e8:8086:cb83 with SMTP id
 af79cd13be357-7f58d941ce0mr891896885a.28.1756332435727; Wed, 27 Aug 2025
 15:07:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com> <cff7c8d0-cdd8-4ba5-864a-936a059624d8@roeck-us.net>
In-Reply-To: <cff7c8d0-cdd8-4ba5-864a-936a059624d8@roeck-us.net>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 28 Aug 2025 08:06:57 +1000
X-Gm-Features: Ac12FXwItn5RDOOJRHCpy_8GPQsXlU1HYJaUvZiX6yrBr_5ZrTi13wSDfRmUQBk
Message-ID: <CAHgNfTx32B4p6U8Z+dy02jWdQhW0uR3ytovc5u-3bE8kNk=p4Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
To: Guenter Roeck <linux@roeck-us.net>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jean Delvare <jdelvare@suse.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org, 
	Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 11:47=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
> > ---
> > Changes in v2:
> > - Added Rob's R-b tag to RTC DT binding
> > - Removed redundant nesting from hwmon DT binding
> > - Dedpulicated property definitions in hwmon DT schema
> > - Made label a required property for hwmon DT nodes
> > - Clarified semantics in hwmon DT schema definitions
> > - Split mfd tree changes into separate commits
> > - Fixed numerous style errors in hwmon driver
> > - Addressed Guenter's initial feedback on the hwmon driver
>
> Don't you think that is a bit useless ? You might as well say "Addressed
> feedback comments" and be done with the change log.
>
> Guenter

I don't think this warrants a v3, so hopefully the amended
changelog below will suffice.

---
Changes in v2:
- Added Rob's R-b tag to RTC DT binding
- Removed redundant nesting from hwmon DT binding
- Dedpulicated property definitions in hwmon DT schema
- Made label a required property for hwmon DT nodes
- Clarified semantics in hwmon DT schema definitions
- Split mfd tree changes into separate commits
- Fixed numerous style errors in hwmon driver
- Removed log messages sysfs read/write functions in hwmon driver
- Removed ignored errors from hwmon driver
- Removed uses of dev_err for non-errors in hwmon driver
- Made it more obvious that a number of hwmon fan properties are optional
- Modified hwmon driver to reflect DT schema changes
- Added compatible property to hwmon node
- Link to v1: https://lore.kernel.org/r/20250819-macsmc-subdevs-v1-0-57df6c=
3e5f19@gmail.com

James

