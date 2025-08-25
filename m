Return-Path: <linux-rtc+bounces-4764-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C07B34D99
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Aug 2025 23:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89B121B25CEF
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Aug 2025 21:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F70233159;
	Mon, 25 Aug 2025 21:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeedcwrY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B5C1632C8
	for <linux-rtc@vger.kernel.org>; Mon, 25 Aug 2025 21:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756156072; cv=none; b=oYuYK0IXdaHsFha/jf1pi7ZcKTNNrPgqE05DTyVqmxi2cD2JupibmwovCXXPLhe8WE0knYsMrAmUbTyjhNQ9MbwfWSquMg661oVywxtjo87MqVvsDRgzO3x9pqdSVtykbdm9uA4FS7v1nRLtIETvjPEbEzoDiV+5GEh4Gr8Xwuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756156072; c=relaxed/simple;
	bh=X0gqCsTsIn7cURuMeKM/NkySDAsE0a2kS1a3DMGvdoE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XaJgmCRNId0I/MDj9aYxHbaItwmCpCkuaT8UYJ7q0k1qRDyXB/u/o/NU9lXHFlmLwU4WPbjKVWpBJf/hm0tMK+/E3z7+wtNuK+4EEtOWiEUcF0v0+YDTctqqXOT8qCP1qrhoO3l72nipfWN8uEY3t1cwchtiCiRpRBLhV1pFvVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeedcwrY; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4b109c4af9eso40831191cf.3
        for <linux-rtc@vger.kernel.org>; Mon, 25 Aug 2025 14:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756156069; x=1756760869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n5Mq4BpgG3dIMghvz372OSV7X3wUc0hg/y2jhmoYPJA=;
        b=VeedcwrYvGjEptZzOmuX1tRP1dzloJI2os9RktnEFG/yyxOp37qPZG99fEsu1T6TDk
         oLE6J60ny0GRG3IHEB4WWxB35/TTN/XSv1KX7XMOFO7g60Mrwgyhi/tg+VdmW9UX5uZl
         t7y4c4GJVv07BmteVDrBHnD0S9sSi5Cv0sOd2PGewTXbcNy7qb2bZRc8qLp/NRowxsPk
         AFbx+erfbw0KVWYQgKP88W0mVjDqZkxs2gox4HxEuPUObasRTM9o+bXZIYf5bfPBCrIq
         OAW8QY6QZ9ZC0jUnh1TxAv2tM+yoPioHypO7rLnPYlYtXvv1htRiN41GAH9fQdaFvOBp
         7Teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756156069; x=1756760869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n5Mq4BpgG3dIMghvz372OSV7X3wUc0hg/y2jhmoYPJA=;
        b=dhB3RDygF/sBV5mpQhVRxCRbrDCMvuEOAj0VYMKkeHy0a/E1gJlQ50vxyKOpg8zohm
         C+w9h7eQ8lO6SlNS/WmH96uJbxnyKNAoD2Gcpf7j8+9vzx6nffM1Tf7q+xQOZydMrU1S
         fqldI9KJRwd3l5EANcUZKzai628INv6RiaziGRNn5+YzS3UOiD2KniBPub2gk6BdLL1t
         ZCWXOSJekeaBYrTq+1NL15RiIzjdXUwVWOrMTdTb9zymc1INSRBunbl/YqNG5mJ9ofbq
         nngCIApvW2wiJ1EJ4/v9PLDV/ykzgwNlvfzVDfYyJihm6mtr7riEF3SXAtkSysJiFr4n
         f0Kg==
X-Gm-Message-State: AOJu0YxbV4KgeI89ou4LfwRTK19KyaHdau01nydHW2FQjCUcdKmET78P
	SYspCchU6sWtXjCYyvnYLZr2D2gziEqniAwtOJYRolbOWcR+ilpQzZ0jsSzgAQ==
X-Gm-Gg: ASbGncvhwECGO8l6Ba1WKc3vCbneCnq7EUL/dfs09NIAq3wqhUDMVgD4Tq2juDvNU91
	kCExbOgDXmm3J+U8FwjDiaT6TSEixddNUc3iAgebZoCjJM2RcfdQbWDpLtwRZKHWrXCL5vAFYe+
	hXpSwsLZE3e2vkBTXsuTt2Rql3e81AkIct1pz858klmwjhjJmO+ZX8k1FR9JOIDwJBk1Ph+mAZA
	f94CqS0W4kmLWz8CKLlcFCM6oqzwX9IG2O5wxIfN8/sC0WjLpMX22jAEPdJf3y/dRboequm4vnZ
	sfcoI1MBEdK9EdA3LkT41Ub3DWrPY91aTFdoNFLuyHAZ8y+e5AeU4iSDnZo+t1Bdgb4AacN9akR
	ki0cE/n5ISlj3s/GIX/msGpfYA4xqFlQ50XbiIGv05z2eegXdozTQ5tlirqHjRWCA5KFKYs6ylA
	LPcmYJvJhiai568bSHMw==
X-Google-Smtp-Source: AGHT+IEMbOA2DH0UMY7yfdqZcnmXTjoPqRKFP0AJS5Q2xBTjygfWOxcWbvqrNPVyo4BG4XKzAzKwmA==
X-Received: by 2002:a05:6214:29e7:b0:70d:c316:f37d with SMTP id 6a1803df08f44-70dc3176600mr41599886d6.64.1756156068732;
        Mon, 25 Aug 2025 14:07:48 -0700 (PDT)
Received: from daniel-desktop3.localnet (174-138-218-72.cpe.distributel.net. [174.138.218.72])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da7288ef2sm53792926d6.44.2025.08.25.14.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 14:07:48 -0700 (PDT)
From: Daniel Tang <danielzgtg.opensource@gmail.com>
To: linux-rtc@vger.kernel.org, systemd-devel@lists.freedesktop.org
Subject:
 Conflict between 1-indexed kernel struct rtc_time and 0-indexed userspace
 struct tm
Date: Mon, 25 Aug 2025 17:07:46 -0400
Message-ID: <5818530.FO833rMHq7@daniel-desktop3>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hello,

The difference seems undocumented and ignored by userspace. At https://
github.com/util-linux/util-linux/issues/3707 , we discussed the mismatch. My 
kernel module's assertion that a `rtc_time64_to_tm(rtc_tm_to_time64(tm), 
&tm_check)` will result in a bit-identical struct failed at tm_yday.

Userspace https://man7.org/linux/man-pages/man3/tm.3type.html documents a 0-
indexed int         tm_yday;   /* Day of the year  [0, 365] (Jan/01 = 0) */
The kernel struct rtc_time is uncommented, but https://github.com/torvalds/
linux/blob/b6add54ba61890450fa54fd9327d10fdfd653439/drivers/rtc/lib.c#L136 
intentionally adds 1 to make it 1-indexed, and this appears to have been 
consistent through git history. rtc-asm9260.c and rtc-lpc24xx.c read from 
tm_yday before writing to hardware, but it tm_yday may have been corrected by 
an overwrite by other parts of the rtc core. My kernel module validates 
tm_yday but doesn't use it, whereas it may be unknown whether other modules 
are expecting a 1-indexed or 0-indexed value.

I was about to suggest that userspace perform `tm_year++` before the ioctl, 
but then https://github.com/systemd/systemd/issues/
38715#issuecomment-3221685983 said:
>At least, rtc(4) states about struct rtc_time as
>>The fields in this structure have the same meaning and ranges as for the tm 
structure described in gmtime(3).
>I guess this is a kernel driver or firmware issue if it does not work.

What should be done to make the 0-indexing/1-indexing of tm_yday consistent 
between kernelspace and userspace?

Sincerely,
daniel . z . tg



