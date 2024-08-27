Return-Path: <linux-rtc+bounces-1747-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB9C9614A7
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Aug 2024 18:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C853286238
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Aug 2024 16:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775F61D0DDF;
	Tue, 27 Aug 2024 16:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AY/jtpSn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38DE1CDFBD;
	Tue, 27 Aug 2024 16:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724777578; cv=none; b=NEPzPimm2nOEwjaLq7ImQtr7KeGIUaweK8y2YlJkKW2FLKls07/c31Hoq/2BB73u0fpe7hh82NFR9lX6QZnejKjIVxWEyf/KtrdhLU2qZfxmvCkAhetIpzJQBfQb6Cum2o2UB2pZX6Mu4PWXPI0Th5Q2IVqWMNhlBufJOC3+bV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724777578; c=relaxed/simple;
	bh=fbFu4tV7WKNsBzDksuuyxwl/QdiXcuuMStHtiLt1olY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lDuUZrf/2NJisOc5EJkeHyaW+wGsEwi/RbDHUnPoG5XL+wC08ycIcBZOPCzcCYj6udgw782FRjvFvVb77zHlMvhxu11oRPm4KVd9Q8pL6UAHzcCoETQIzpv44nyLtnRo6Ye+r5Y2PeFkgrVplu7BikYlvEQyb9mYRWQZnrZt9Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AY/jtpSn; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2d3c08541cdso4493710a91.2;
        Tue, 27 Aug 2024 09:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724777576; x=1725382376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgufQIEOckAZWWO2W51+cL+ZYcIhyk1JdZ2OgFTRv3Y=;
        b=AY/jtpSnWOtJ20g6w3EcvZ2rwl3SAIxkCbDi6WYIhaizehnzWpgIjkCPCG3iVjHNGH
         TEzqAEVi4YVBnlwwvrdtJ2kPzw2SdV8cYJUqtdzO1xdGF+/enlrfMbhy3SBPNGAyXnEL
         KmsXe2nYpSi758yqfVVNRdXw+DT3R9KChA+Un22BcInzaSFHz+psFjdKu9/LAmsdzFQS
         Ue+owPQN/sKiqnhD/bbd48a6CMgYrK7C+BfD67YQ+ZCRPj/YN1G2+9zj7+V+T8OKQJv5
         bKqkfU7PpbzpJ8DJgtNtOMAvAGVGox/9MMnVeI/XQLIo6sl6HP3D6L7uoqEBJbMnxxJS
         XQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724777576; x=1725382376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgufQIEOckAZWWO2W51+cL+ZYcIhyk1JdZ2OgFTRv3Y=;
        b=HrKrU61eAhYjyZzCb6RmBazVkRWuiCHu8lNsYqNiWNXEMHlSUuEO8YbhLx9DVFzqWh
         zJtT6P+IIGxLglqvwLwPtGe0u8tF4MLxdQxKRUDiwqY37h6eYMxGg/1IgaDpJvSrSoIE
         5dz9I78loGJUf9FvM/m9eALzEEiXns+slb3XicEqcjWaV8SIncO85yNEcHrpxg14zKG+
         46z5DwvpqzcSb9kgfGxZxsfjOGkDklMfM1e9lh7tXTlZ2lIuP+yoUX1OuCBNrshRpMJ5
         LmOoVDwHgHIfjx9fx/go/TeU52x68gzJllJ4GU9LM8lysjp6k4LAhNG0FU/UkpAmJlI2
         rP5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW52dYpbVwnDzaPtlGEeKONgcZA+ZQoKoLCpQx0Fd2NZxO+vmTUwbDyqZYk8nScC410tZdbmTFUVvmr@vger.kernel.org, AJvYcCWYNvidBfBUevpWpnUEY/E4wb05U09vIfO+tUqYsHWqmIVQb3veZ+45Y3e7XSG6mkUKl7ba0yqoqHUX5AE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBBLE/G3hNJATmmh6w18anJ3+DOl1Syleyy+lF626ivVnmQCuj
	0bp76FQfwLRm6sAtIMkzuhgXH6LINkP4rTb9MBAGH5rq9uuh9aEu
X-Google-Smtp-Source: AGHT+IEL4IxrVWd7WYCyCWbVkrBhxEhWWuzch3KnZ8hA9ZodiW+9hzqIj+K0j0RA3JErddA2hi0JHg==
X-Received: by 2002:a17:90a:5ac4:b0:2d4:6ef:cb14 with SMTP id 98e67ed59e1d1-2d646d386admr14347548a91.28.1724777575847;
        Tue, 27 Aug 2024 09:52:55 -0700 (PDT)
Received: from embed-PC.. ([106.222.235.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613a6123fsm12333081a91.33.2024.08.27.09.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 09:52:55 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	rbmarliere@gmail.com,
	skhan@linuxfoundation.org,
	abhishektamboli9@gmail.com
Subject: [PATCH] rtc: m48t59: Remove division condition with direct comparison
Date: Tue, 27 Aug 2024 22:21:31 +0530
Message-Id: <20240827165131.34592-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809155631.548044-1-abhishektamboli9@gmail.com>
References: <20240809155631.548044-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Alexandre,

I wanted to check if you had a chance to review the patch I sent to you [1]. 
I understand you may have a busy schedule, but I would appreciate 
any feedback you can provide when you have time.

The patch is available here:
[1]: https://lore.kernel.org/all/20240809155631.548044-1-abhishektamboli9@gmail.com/

Thank you for your time. 

Best regards,
Abhishek


