Return-Path: <linux-rtc+bounces-1460-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE0E92C23A
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Jul 2024 19:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7A6CB27F0B
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Jul 2024 17:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40746180043;
	Tue,  9 Jul 2024 16:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPp8Tb2w"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C78180042
	for <linux-rtc@vger.kernel.org>; Tue,  9 Jul 2024 16:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720543674; cv=none; b=WnES/W3nLpgitmTXSP7B3mFQkidLfobjX78q8D+yc80iW7anXkKxbuvCjsrednwg852knrGEnVJ5BGrgL58TTyYWN+dZ+psssmsyi1Z2HfN2ti/sMpze7j4PoXTVWaB257ZV3euyjiErRjHdbF3wh+1LF0krKfPqtbi+mNMRnHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720543674; c=relaxed/simple;
	bh=o8rctgk3Fxgf15KKwZzEpoUUipOzUfrL+e9A4m/o+Zg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Bji5trRKDyl4eC9UihoinVhqD28Sb7kgVkOGbY0eZk1xf9/QAKibr9/mWURAamvlKrZWqBmbl24Euum42/Gv/IM3kl+c+2Mat/KaJXQ4XWXzpsklpNKN1Wc0LU/Qf6UquPsLrX3ncw2ZnfqiwFXTEG4VG0REXYKYEjGdDLCUdO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPp8Tb2w; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ee4ae13aabso54629521fa.2
        for <linux-rtc@vger.kernel.org>; Tue, 09 Jul 2024 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720543670; x=1721148470; darn=vger.kernel.org;
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
X-Google-Smtp-Source: AGHT+IEjC/LfT7CZLNdji1R+OXon2ii8e0fyAcTMqORjZg8SMgivyExfUx0e6pJjVxYn6fkbtyFEPNGP3G+qMACKvgc=
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

