Return-Path: <linux-rtc+bounces-1925-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFE197470F
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 02:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9931328762F
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 00:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3811AC450;
	Tue, 10 Sep 2024 23:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=noa-labs.com header.i=@noa-labs.com header.b="F4QweBeU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFBC15C156
	for <linux-rtc@vger.kernel.org>; Tue, 10 Sep 2024 23:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726012743; cv=none; b=fRsZS5aSotO/YvZY/OtDWhn8PCDxXkOdOTRAwYUaclF0PZCUeqAp4g4l1ksImi0dYVOhinv2vurEh7zbkXRBWDSbS69X8Mip5b5/rU8vDSwKUYGtUGtsjYxbnL3jEiuTGfcHlFOuJEqAb4QSDwmv2pUMLiBMIyEIO5iRXW9g980=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726012743; c=relaxed/simple;
	bh=U2UbwCbXDaKbSYH6swG7PmY2C2FunT/2oxA9VuaIv/c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=fjFgkuzW/+DNWs2K38+zBBiKd4DtrjiyAQz9ZyZyqbKnAXE4AH9wWg7Y3K2j3fGBU5o4hVynJZTYmABG+lCD0ZVeDZphDmFOdhM4VTEJ4JKj1f8rOa8Fvjcg4X2RzpKN5/37H/kI7aMv3xfx2TjQgfgTTWQVEFMODh8vPQ2A+wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=noa-labs.com; spf=pass smtp.mailfrom=noa-labs.com; dkim=pass (1024-bit key) header.d=noa-labs.com header.i=@noa-labs.com header.b=F4QweBeU; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=noa-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noa-labs.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso6344561276.0
        for <linux-rtc@vger.kernel.org>; Tue, 10 Sep 2024 16:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noa-labs.com; s=google; t=1726012739; x=1726617539; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U2UbwCbXDaKbSYH6swG7PmY2C2FunT/2oxA9VuaIv/c=;
        b=F4QweBeUKJ6CkqLAD+fU/i+EyNVGSd5UvSnIvQjw7d4YQmKacYI2TtPfUgx6IZZOvo
         bpXEaezjWeF1Ejahi9k9DU19ZDhnuMaZuHYXe95oev43wXjXAkULod1n5A3uhpvKeI2n
         a5YgMGm+zUVk2c7cTiUtkFmDebW/w1/5q4vtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726012739; x=1726617539;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U2UbwCbXDaKbSYH6swG7PmY2C2FunT/2oxA9VuaIv/c=;
        b=Dywvqqij6KeqFsgpIB8SE1RlUxwA3l119cnV1l/ylU/7i03e1LDQ3oGua4mMiYFBNa
         fVRPadBQzxKYjCFThzs55VGRJEY9QvAtjOI1egxVlFKiFpVtqXg19EJqgBj4iIG3CHfr
         iIcwFiXF00lgPN4EeKfcFdaBr2/Q7Pa/D/d0Ha/+7Zu/soOrJBXYgIhbifnlr9w47rJ2
         lLFne0DXXZawy2RMf+nNzEJYMn0RyYTRtUAlObQfsqvNU/4dM1d5dK9YZyIQl/Mimsfz
         2U4ZkMmEm9et1v5Xk+JxHFBFSjtgTCr3M1qtkqPivUEqXC0FWd0dVPs7w6/Hl55RXIWq
         I+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXPJVMcUVwx13qXSD/K54FhCenR6jzWQ4RoGbFn9XDXneExDaHtko0OIqlPigPcggipDYbLJa5qzoI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7DzCw0xstLu6bmm9y3XXqRozNdwwRGe33ggW6fn7OehdGG0WP
	T08jfuy9P8JMumfF9K20o9gM4JA09nb1NTnmWlRIoYlOmmOynWM1kO644vtob+RoKMlLGuVyfGB
	T4Fa2mjruXwYfrBKW7o9PMthn0znX5bMyXMBOEeahhznh9j10ka02MQ==
X-Google-Smtp-Source: AGHT+IEfbGIeXED36wupqOboqFnHeRt1U6SUbwiLArYRZEk42oWse6mfU322KE+vjnJOlKzDX3sU3vOESPOhF4dz3Mg=
X-Received: by 2002:a05:6902:1707:b0:e13:cb77:5fda with SMTP id
 3f1490d57ef6-e1d3486658fmr15475234276.12.1726012738792; Tue, 10 Sep 2024
 16:58:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Pavel Nikulin <pavel@noa-labs.com>
Date: Wed, 11 Sep 2024 03:58:49 +0400
Message-ID: <CAG-pW8EGsxV85J+QcP4yKnngutdPoMBGWNN8LnAM3nU+7DKPnA@mail.gmail.com>
Subject: Re-enabling EFI RTC on X86 for modern systems
To: alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I noticed that EFI RTC was disabled on X86 really long time ago due to
Intel reference firmwares coming with broken EFI.

I edited the Kconfig to enable it, and see how it works on my laptop
(AMD HX370). I can confirm that it boots well. I have not done any
more extensive tests than that.

What do you think about re-enabling EFI RTC behind some expert config
flag, and ask more people to test it on modern X86 hardware?

