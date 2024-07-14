Return-Path: <linux-rtc+bounces-1497-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C882930BB0
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Jul 2024 22:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0308B21DB8
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Jul 2024 20:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DF8139D10;
	Sun, 14 Jul 2024 20:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqj43EAs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE3B18AED
	for <linux-rtc@vger.kernel.org>; Sun, 14 Jul 2024 20:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720990478; cv=none; b=Pd+vXlNLAjOnUAoLhFwvbZC37HZvBTg4yXbuc47fmtGvg8YJIp24Po4reVzq24Eab8iLn5ixB5DGNRPFS7an3AlJXnxZE1+MrIBrPldNboaBfmCbqfbf7vX2KMthZ2qXFkJqys9WYsq11evbr7HzfKEtqBd66vwNyfoqFvWc9ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720990478; c=relaxed/simple;
	bh=eRjUZotx2tMpk8bqCJeATi+4zmWXulWqAyTvnFg87NM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Mlpg1t8CagHTz6A6HOokG1lIWu/XlrXsa+iZNzbdEmYChxTisiteB/hhyiUGbB/59mH3K9V1kI+HjUYH2EhXOxHwJjyIOWTJE/ldFvZYIbDwajsMy6D8p/RkhRq8Nk/xPjdPZjrWek37ms3c2wgZwHXdmK+D9enDPCWkPEPQEYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqj43EAs; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ee910d6a9eso28296261fa.1
        for <linux-rtc@vger.kernel.org>; Sun, 14 Jul 2024 13:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720990475; x=1721595275; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZDoihiaCGttfddlH9ay6tri+gMpb1if6tqeQrX0imII=;
        b=eqj43EAsNInsrMb3mJTAvswiUxnivMvgKjCb578v+U1AGABwcSXTOkCI7MhYCWec0C
         bERa8B3rRrLs8g05TTsqWxMTGeA0n/WKjDQrFDpWmPg/NdDxW9dt/0PHHT9i6sZ3TQWr
         rMYM7SFww3d837zVkJ8fovQlb0z0qkKjdklkHXAMr7jg3BDNF51bR8Hx1qQIU5NfMF5l
         fLmGylaYY86XfmJewcShB31bZdxbbykMOUw9jON+Z9cYsccqAlyVmZP6qSOOGRclSA4I
         qyhf1gUiQYsS42v5DpD75r0DUCAR9lPK+ivrMuge7NTdg1GqCSZTsPb3PPgOfcpISjZa
         5EEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720990475; x=1721595275;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZDoihiaCGttfddlH9ay6tri+gMpb1if6tqeQrX0imII=;
        b=t/OonGX7i4Nn70uGuAaxlk6ayogf2NuOcajqMW08vjIubXt8EMSETTdaSPY3CVSPtv
         52vG+qHDyPohX2FFVasjeqfbgnLUdnXfOBa1eEPQa2cSNPCrpTItJV9ElPVBR9epibHa
         5qdCrvKE5hdXzm3HPfS7ac+H5+cCuibjsgESuoas/XqdORl1hNE7y6nqKrq4nygXn7yW
         I4/OCyT3k239lUXXaIEx2ktEhUQ0wJAnjO1nBfaCrHpP0wTpZRrc24XgOlorh+huR039
         szc09bk2TgW5qCozFWEnJ0KgV6rRDeeENUQBO6wgYd2lTjlEPm4yjTOT+ZbYL4GT3Gap
         vfYg==
X-Gm-Message-State: AOJu0YwrEIoHUt3TlDpYgWqHtiDvBY2NRRJcUcx3PiJe/AiRMKpi+t6o
	YWthmN0pDOP6aFbjyhY/y0FUpGxRAKReuSfMUnjYsVJCdLdKgvmuDkUXt0MmHL2GohLuT8O3DxR
	6nX48jnfi1ZxIuulSFM92qNCn8o4JSYO7
X-Google-Smtp-Source: AGHT+IFBg3lWjQrXOn2dyiWg4k0YEZAHS6MoLs3Rj4fFV+4SFCyE49l8VkSTwfYK0Mr54jxPItGY8VcBVxfss/DZ3/4=
X-Received: by 2002:a2e:2283:0:b0:2ee:deb7:945 with SMTP id
 38308e7fff4ca-2eedeb709d8mr14521491fa.5.1720990474019; Sun, 14 Jul 2024
 13:54:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Sun, 14 Jul 2024 15:53:57 -0500
Message-ID: <CAJ8C1XMF8rr9Wd9ny30QeVfGV4gSnU4CoS9rtch7ZgAdgTHRCA@mail.gmail.com>
Subject: RE: RTC driver error
To: linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From mboxrd@z Thu Jan  1 00:00:00 1970
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
[209.85.208.178])
(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
(No client certificate requested)
by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C78180042
for <linux-rtc@vger.kernel.org>; Tue,  9 Jul 2024 16:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none
smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
t=1720543674; cv=none;
b=WnES/W3nLpgitmTXSP7B3mFQkidLfobjX78q8D+yc80iW7anXkKxbuvCjsrednwg852knrGEnVJ5BGrgL58TTyYWN+dZ+psssmsyi1Z2HfN2ti/sMpze7j4PoXTVWaB257ZV3euyjiErRjHdbF3wh+1LF0krKfPqtbi+mNMRnHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
s=arc-20240116; t=1720543674; c=relaxed/simple;
bh=o8rctgk3Fxgf15KKwZzEpoUUipOzUfrL+e9A4m/o+Zg=;
h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
b=Bji5trRKDyl4eC9UihoinVhqD28Sb7kgVkOGbY0eZk1xf9/QAKibr9/mWURAamvlKrZWqBmbl24Euum42/Gv/IM3kl+c+2Mat/KaJXQ4XWXzpsklpNKN1Wc0LU/Qf6UquPsLrX3ncw2ZnfqiwFXTEG4VG0REXYKYEjGdDLCUdO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass
(p=none dis=none) header.from=gmail.com; spf=pass
smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com
header.i=@gmail.com header.b=dPp8Tb2w; arc=none
smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none
dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass
smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
header.b="dPp8Tb2w"
Received: by mail-lj1-f178.google.com with SMTP id
38308e7fff4ca-2ee4ae13aabso54629521fa.2
        for <linux-rtc@vger.kernel.org>; Tue, 09 Jul 2024 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720543670; x=1721148470;
darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mNkeLWknItbbY39SIOgs4b/pZtW4M3vblpyNbfqqHsk=;
        b=dPp8Tb2wh6UbzxGaZaRgvMCcxGnToplMMek2lcHFamilXhpuJBtp/CqxeCli8pJXRz
         3MDbpgH8PK4b7P7hWpb3OOp8TzeWZRhXAIQCu9LgsxwvuiGumii7cu3Fs3XLQ01uTJyj
         RVCHFGqe/r1zziUeKe10eL0XimDOWq1Dbzd+WErRo5ikewVDuDHwVHGjiiDKf6BOnE7/
         bprw8IXObXOjgGTxqZAXHA9AFS4SRgnkv01yU3vD6qRfOx/xbV+8SpE2zm3vVn828P0W
         SYLcEwC3zMNCsK0FiK1LgIRHi+K0rJEa4O00+1xMZGABI6TThUyFYvhBieHykXxcBnOQ
         Ifqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720543670; x=1721148470;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mNkeLWknItbbY39SIOgs4b/pZtW4M3vblpyNbfqqHsk=;
        b=Rzm+tCfYGj50TRmgJaBxnAQHXDYEu9MFtf9koZfKDJsRLyKJrdo0Ta3WuWzfIFvqhN
         iuZ/2x3jJ8kqP5iFQRsS5ond6mPLHMWU47OLeoWQnvvQouJuRbhtLgm5qqkcSyIW0XdL
         4WLKltwUoaXuzNStGKbVDjTXP7e8YNsbCFqoFZmWvmSou1Wy1tGPQQzFNpJUuCPkNOm+
         FiYsWIMWjdfN0mn7Q0BN0QNOnm+UgEL0quDMUlwA54A2n3KHKXiQRNND5bSTRYyPd3jX
         tu8NgxW7nE2wGRBVL8CTOxu01gko1CH8KuD60u2UCxC9iheMu1D+VW2DTtHmIC00t2QA
         TiYQ==
X-Gm-Message-State: AOJu0YxGxQI0oAp4CJXuU/6MUbW15haxK+5609s7Ap/Ij17br0gPLpVk
+d7iOXz7OoWA4qhSR7aigwYat2uRoEUSPITucRCN2I9yU3IA64v4zo7hNA48XX6IuYNlx1iDbO5
UuVJjhjlbbxBD/9R0NXf1rcfw72zUUA==
X-Google-Smtp-Source:
AGHT+IEjC/LfT7CZLNdji1R+OXon2ii8e0fyAcTMqORjZg8SMgivyExfUx0e6pJjVxYn6fkbtyFEPNGP3G+qMACKvgc=
X-Received: by 2002:a2e:9bd5:0:b0:2ee:4aaf:5f16 with SMTP id
 38308e7fff4ca-2eeb30ba04cmr19227701fa.1.1720543670125; Tue, 09 Jul 2024
 09:47:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Tue, 9 Jul 2024 11:47:13 -0500
Message-ID: <CAJ8C1XMJX3JCeFE89aimGK7J3eLCKNbYVZ7Bbi5Jr5R-oXgBZw@mail.gmail.com>
Subject: RTC driver error
To: linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

The RTC driver for the DS3231 has an issue:  It removes the
`wakealarm` setting from the chip's register when the system is
booted.

What can be done to correct this behavior?

Rgds,
~S

As there have been no replies to this post, I'm unsure of its status.
And so I am replying in an effort to get some feedback.

IMHO, it is an error to remove the 'wakealarm' setting from the RTC's
register during a boot - or in a `reboot`.

Can someone explain why this is done?  Alternatively, if someone can
explain **where** the code needs to be modified, I can have a go at
doing it myself.

Rgds,
~S

